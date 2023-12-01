//
//  FriendsViewModel.swift
//  Futboly
//
//  Created by Andrei Tanc on 31.10.2023.
//

import Foundation
import ProgressHUD

class FriendsViewModel: ObservableObject {
    @Published var friends: [User] = []
    @Published var searchedFriends: [User] = []
    
    @Published var ownRequestsUserIds: [String] = []
    @Published var friendRequestsUserIds: [String] = []
    @Published var friendsUserIds: [String] = []
    
    @Published var friendRequests: [FriendRequest] = []
    
    var friendsScreenType: FriendsScreenType
    @Published var searchText: String = ""
    
    @Published var shouldPresentCardPopup: Bool = false
    
    init(friendsScreenType: FriendsScreenType) {
        self.friendsScreenType = friendsScreenType
        
        switch friendsScreenType {
        case .existing:
            getExistingFriends()
        case .friendRequest:
            getFriendRequestData()
        case .new:
            getNewFriendsData()
        }
    }
    
    func inviteFriend() {
        Router.shared.goToScreen(withRoute: .newFriends)
    }
    
    func filterSearchedFriends() {
        // If searchText is empty, reload all friends
        guard !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            searchedFriends = friends
            return
        }
        // Show only friends that contain the searchText in their teamName OR country
        searchedFriends = friends.filter({ $0.teamName.lowercased().contains(searchText.lowercased()) || $0.country.lowercased().contains(searchText.lowercased()) })
    }
    
    private func getFriendRequestData() {
        FirestoreManager.shared.getReceivedFriendRequests { [weak self] friendRequests in
            self?.friendRequests = friendRequests
        }
    }
    
    private func getNewFriendsData() {
        let group = DispatchGroup()
        
        group.enter()
        FirestoreManager.shared.getUserIdsForOwnRequests { [weak self] userIds in
            group.leave()
            self?.ownRequestsUserIds = userIds
        }
        
        group.enter()
        FirestoreManager.shared.getUserIdsForFriendRequests { [weak self] userIds in
            group.leave()
            self?.friendRequestsUserIds = userIds
        }
        
        group.enter()
        FirestoreManager.shared.getUserIdsForFriends { [weak self] userIds in
            group.leave()
            self?.friendsUserIds = userIds
        }
        
        group.notify(queue: .main) { [weak self] in
            self?.getPotentialFriends()
        }
    }
    
    func getPotentialFriends() {
        let exceptUserIds = ownRequestsUserIds + friendRequestsUserIds + friendsUserIds + [FutbolyVault.shared.user.id]
        FirestoreManager.shared.getAllUsers(withoutUserIds: exceptUserIds) { [weak self] users in
            self?.friends = users
            self?.searchedFriends = users
        }
    }
    
    private func getExistingFriends() {
        FirestoreManager.shared.getAllFriends { [weak self] friends in
            self?.friends = friends
            self?.searchedFriends = friends
        }
    }
    
    // MARK: - Friend Requests
    
    func sendFriendRequest(to user: User) {
        ownRequestsUserIds.append(user.id)
        FirestoreManager.shared.sendFriendRequest(toUser: user) { error in
            guard error == nil else { return }
            
        }
    }
    
    func acceptFriendRequest(_ friendRequest: FriendRequest) {
        FirestoreManager.shared.acceptFriendRequest(friendRequest) { [weak self] in
            self?.handleFriendRequestAction(friendRequest, withStatus: .accepted)
        }
    }
    
    func declineFriendRequest(_ friendRequest: FriendRequest) {
        FirestoreManager.shared.deleteFriendRequestFromDB(friendRequest) { [weak self] in
            self?.handleFriendRequestAction(friendRequest, withStatus: .declined)
        }
    }
    
    func handleFriendRequestAction(_ friendRequest: FriendRequest, withStatus status: FriendRequestStatus) {
        for index in 0..<friendRequests.count {
            if friendRequests[index].id == friendRequest.id {
                friendRequests[index].status = status.rawValue
            }
        }
    }
}
