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
                
                if viewModel.friendsScreenType != .friendRequest {
                    FutbolySearchBar(text: $viewModel.searchText) {
                        viewModel.filterSearchedFriends()
                    }.padding(.horizontal)
                }
                
                if viewModel.friendsScreenType == .friendRequest {
                    friendRequestsList.padding(.horizontal)
                } else {
                    friendsList.padding(.horizontal)
                }
            }
        }
        .fullScreenCover(isPresented: $viewModel.shouldPresentCardPopup) {
            BottomCardPopupView(cardType: .friendlyMatch) {
                // action
            } secondButtonAction: {
                // action
            } dismiss: {
                viewModel.shouldPresentCardPopup = false
            } .background(ClearBackground())
        }
    }
    
    var friendsList: some View {
        ScrollView {
            LazyVStack(spacing: 15) {
                ForEach(viewModel.searchedFriends, id: \.id) { friend in
                    FriendRowView(friend: friend, friendType: viewModel.friendsScreenType, isButtonEnabled: viewModel.friendsScreenType == .existing ? true : !viewModel.ownRequestsUserIds.contains(friend.id)) {
                        if viewModel.friendsScreenType == .new {
                            viewModel.sendFriendRequest(to: friend)
                        } else {
                            viewModel.shouldPresentCardPopup = true
                        }
                    }.onTapGesture {
                        Router.shared.goToScreen(withRoute: .profile(friend))
                    }
                }
            }.padding()
        }.background(.white)
        .clipShape(.rect(cornerRadius: 24))
        .searchable(text: $viewModel.searchText)
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
