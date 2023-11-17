//
//  FriendsView.swift
//  Futboly
//
//  Created by Andrei Tanc on 31.10.2023.
//

import SwiftUI

struct FriendsView: View {
    @ObservedObject private(set) var viewModel: FriendsViewModel
    
    var body: some View {
        ZStack {
            Color.lightGray.ignoresSafeArea()
            VStack(spacing: 30) {
                FriendsHeaderView(friendsScreenType: viewModel.friendsScreenType, inviteFriendAction: viewModel.inviteFriend)
                
                if viewModel.friendsScreenType == .friendRequest {
                    friendRequestsList.padding(.horizontal)
                } else {
                    friendsList.padding(.horizontal)
                }
            }
        }
    }
    
    var friendsList: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(viewModel.friends, id: \.id) { friend in
                    FriendRowView(friend: friend, friendType: viewModel.friendsScreenType, isButtonEnabled: viewModel.friendsScreenType == .existing ? true : !viewModel.ownRequestsUserIds.contains(friend.id)) {
                        if viewModel.friendsScreenType == .new {
                            print("new friend action")
                            viewModel.sendFriendRequest(to: friend)
                        } else {
                            print("existing friend action")
                        }
                    }
                }
            }.padding()
        }.background(.white)
        .clipShape(.rect(cornerRadius: 24))
    }
    
    var friendRequestsList: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(viewModel.friendRequests) { friendRequest in
                    FriendRequestRowView(
                        friendRequest: friendRequest,
                        acceptAction: viewModel.acceptFriendRequest(_:),
                        declineAction: viewModel.declineFriendRequest(_:)
                    )
                }
            }.padding()
        }.background(.white)
        .clipShape(.rect(cornerRadius: 24))
    }
}

#Preview {
    FriendsView(viewModel: FriendsViewModel(friendsScreenType: .existing))
}
