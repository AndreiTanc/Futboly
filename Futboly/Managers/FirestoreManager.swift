//
//  FirestoreManager.swift
//  Futboly
//
//  Created by Andrei Tanc on 10.11.2023.
//

import Foundation
import Combine
import ProgressHUD
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

enum DatabasePath: String {
    case user
    case friends
    case ownRequests
    case friendRequest
    case allFriends
}

class FirestoreManager: ObservableObject {
    static var shared: FirestoreManager = FirestoreManager()
    private let database = Firestore.firestore()
    
    private weak var userSnapshotListener: ListenerRegistration?
    
    private var userId: String {
        Auth.auth().currentUser?.uid ?? ""
    }
    
    func start() {
        listenToUserChanges()
    }
    
    func stopListening() {
        userSnapshotListener?.remove()
    }
    
    // MARK: - Current User

    func saveUser(_ user: User, completion: @escaping () -> Void) {
        var user = user
        database.collection(DatabasePath.user.rawValue).document(userId).getDocument(as: User.self) { [weak self] result in
            completion()
            guard let userId = self?.userId else { return }
            if case .success(let userData) = result { user = userData }
            
            try? self?.database.collection(DatabasePath.user.rawValue).document(userId).setData(from: user)
            self?.listenToUserChanges()
        }
    }
    
    func updateUser(withParams params: [String: Any]) {
        database.collection(DatabasePath.user.rawValue).document(userId).updateData(params)
    }
    
    func listenToUserChanges() {
        guard userId != "" else { return }
        userSnapshotListener = database.collection(DatabasePath.user.rawValue).document(userId).addSnapshotListener { snapshot, error in
            guard let snapshot, let userDict = snapshot.data() else { return }
            let user = User(fromDict: userDict)
            FutbolyVault.shared.user = user
            
            StorageManager.shared.getProfileImageIfNeeded(forUser: user)
        }
    }
    
    func getAllUsers(withIds ids: [String], completion: @escaping ([User]) -> Void) {
        ProgressHUD.animate()
        database.collection(DatabasePath.user.rawValue)
            .whereField("id", in: ids)
            .getDocuments { querySnapshot, error in
                ProgressHUD.dismiss()
                guard let querySnapshot else { return }
                
                completion(
                    querySnapshot.documents.compactMap({ User(fromDict: $0.data()) })
                )
            }
    }
    
    // MARK: - Friends
    
    func getAllUsers(withoutUserIds: [String], completion: @escaping ([User]) -> Void) {
        ProgressHUD.animate()
        database.collection(DatabasePath.user.rawValue)
            .whereField("id", notIn: withoutUserIds)
            .limit(to: 20)
            .getDocuments { snapshot, error in
                ProgressHUD.dismiss()
                guard let snapshot else { return }
                
                completion(
                    snapshot.documents.map({ User(fromDict: $0.data()) })
                )
            }
    }
    
    func getAllFriends(completion: @escaping ([User]) -> Void) {
        ProgressHUD.animate()
        database.collection(DatabasePath.friends.rawValue).document(userId)
            .collection(DatabasePath.allFriends.rawValue)
            .getDocuments { [weak self] snapshot, error in
                ProgressHUD.dismiss()
                guard let snapshot else { return }
                let userIds = snapshot.documents.map({ $0.documentID })
                self?.getAllUsers(withIds: userIds, completion: completion)
            }
    }
    
    func sendFriendRequest(toUser user: User, completion: @escaping (Error?) -> Void) {
        var requestError: Error?
        let group = DispatchGroup()
        
        // Save sent friend request for current user
        group.enter()
        let ownRequest = FriendRequest(for: user)
        try? database.collection(DatabasePath.friends.rawValue).document(userId)
            .collection(DatabasePath.ownRequests.rawValue).document(user.id)
            .setData(from: ownRequest, completion: { error in
                if let error { requestError = error }
                group.leave()
            })
        
        // Save received friend request for other user
        group.enter()
        let friendRequest = FriendRequest(for: FutbolyVault.shared.user)
        try? database.collection(DatabasePath.friends.rawValue).document(user.id)
            .collection(DatabasePath.friendRequest.rawValue).document(userId)
            .setData(from: friendRequest, completion: { error in
                if let error { requestError = error }
                group.leave()
            })
        
        group.notify(queue: .main) {
            completion(requestError)
        }
    }
    
    func getUserIdsForOwnRequests(completion: @escaping ([String]) -> Void) {
        database.collection(DatabasePath.friends.rawValue).document(userId)
            .collection(DatabasePath.ownRequests.rawValue)
            .getDocuments { snapshot, error in
                guard let snapshot else { return }
                
                completion(
                    snapshot.documents.compactMap({ $0.documentID })
                )
            }
    }
    
    func getUserIdsForFriendRequests(completion: @escaping ([String]) -> Void) {
        database.collection(DatabasePath.friends.rawValue).document(userId)
            .collection(DatabasePath.friendRequest.rawValue)
            .getDocuments { snapshot, error in
                guard let snapshot else { return }
                
                completion(
                    snapshot.documents.compactMap({ $0.documentID })
                )
            }
    }
    
    func getUserIdsForFriends(completion: @escaping ([String]) -> Void) {
        database.collection(DatabasePath.friends.rawValue).document(userId)
            .collection(DatabasePath.allFriends.rawValue)
            .getDocuments { snapshot, error in
                guard let snapshot else { return }
                completion(
                    snapshot.documents.map({ $0.documentID })
                )
            }
    }
    
    func getReceivedFriendRequests(completion: @escaping ([FriendRequest]) -> Void) {
        ProgressHUD.animate()
        database.collection(DatabasePath.friends.rawValue).document(userId)
            .collection(DatabasePath.friendRequest.rawValue)
            .getDocuments { snapshot, error in
                ProgressHUD.dismiss()
                guard let snapshot else { return }
                
                completion(
                    snapshot.documents.compactMap({ FriendRequest(fromDict: $0.data()) })
                )
            }
    }
    
    func acceptFriendRequest(_ friendRequest: FriendRequest, completion: @escaping () -> Void) {
        let group = DispatchGroup()
        ProgressHUD.animate()

        group.enter()
        database.collection(DatabasePath.friends.rawValue).document(userId)
            .collection(DatabasePath.allFriends.rawValue).document(friendRequest.fromUser)
            .setData(["id": friendRequest.fromUser, "date": Date().timeStampString()]) { error in
                group.leave()
            }
        
        group.enter()
        database.collection(DatabasePath.friends.rawValue).document(friendRequest.fromUser)
            .collection(DatabasePath.allFriends.rawValue).document(userId)
            .setData(["id": userId, "date": Date().timeStampString()]) { error in
                group.leave()
            }
        
        group.enter()
        deleteFriendRequestFromDB(friendRequest) {
            group.leave()
        }
        
        group.notify(queue: .main) {
            ProgressHUD.dismiss()
            completion()
        }
    }
    
    func deleteFriendRequestFromDB(_ friendRequest: FriendRequest, completion: @escaping () -> Void) {
        let group = DispatchGroup()
        ProgressHUD.animate()
        
        group.enter()
        database.collection(DatabasePath.friends.rawValue).document(userId)
            .collection(DatabasePath.friendRequest.rawValue).document(friendRequest.fromUser)
            .delete { error in
                group.leave()
            }
        
        group.enter()
        database.collection(DatabasePath.friends.rawValue).document(friendRequest.fromUser)
            .collection(DatabasePath.ownRequests.rawValue).document(userId)
            .delete { error in
                group.leave()
            }
        
        group.notify(queue: .main) {
            ProgressHUD.dismiss()
            completion()
        }
    }
}
