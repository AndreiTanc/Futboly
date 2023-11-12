//
//  FirestoreManager.swift
//  Futboly
//
//  Created by Andrei Tanc on 10.11.2023.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

enum DatabasePath: String {
    case user
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
    
    func saveUser(_ user: User, completion: @escaping () -> Void) {
        var user = user
        database.collection(DatabasePath.user.rawValue).document(userId).getDocument(as: User.self) { [weak self] result in
            completion()
            guard let userId = self?.userId else { return }
            if case .success(let userData) = result { user = userData }
            
            try? self?.database.collection(DatabasePath.user.rawValue).document(userId).setData(from: user)
            FutbolyVault.shared.user = user

            StorageManager.shared.getProfileImageIfNeeded(forUser: user)
        }
    }
    
    func updateUser(withParams params: [String: Any]) {
        database.collection(DatabasePath.user.rawValue).document(userId).updateData(params)
    }
    
    func listenToUserChanges() {
        userSnapshotListener = database.collection(DatabasePath.user.rawValue).document(userId).addSnapshotListener { snapshot, error in
            guard let snapshot, let userDict = snapshot.data() else { return }
            let user = User(fromDict: userDict)
            FutbolyVault.shared.user = user
            
            StorageManager.shared.getProfileImageIfNeeded(forUser: user)
        }
    }
    
    func stopListening() {
        userSnapshotListener?.remove()
    }
}
