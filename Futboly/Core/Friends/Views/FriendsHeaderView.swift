//
//  FriendsHeaderView.swift
//  Futboly
//
//  Created by Andrei Tanc on 13.11.2023.
//

import SwiftUI

struct FriendsHeaderView: View {
    var friendsScreenType: FriendsScreenType
    var inviteFriendAction: () -> Void = {}
    
    var body: some View {
        switch friendsScreenType {
        case .existing:
            existingFriendsHeaderView
        case .new:
            newFriendsHeaderView
        case.friendRequest:
            friendRequestHeaderView
        }
    }
    
    var existingFriendsHeaderView: some View {
        HStack(alignment: .center) {
            FutbolyBackButton { Router.shared.popViewController() }
            Spacer()
            Spacer()
            
            Text("My Friends")
                .font(.system(size: 28, weight: .semibold))
            Spacer()
            
            Button {
                inviteFriendAction()
            } label: {
                Text("Invite new").foregroundStyle(.black).fontWeight(.medium)
            }
        }.padding(.horizontal)
    }
    
    var newFriendsHeaderView: some View {
        HStack(spacing: 15) {
            FutbolyBackButton { Router.shared.popViewController() }
            Text("Invite new Friend").font(.system(size: 26, weight: .semibold))
            Spacer()
        }.padding(.horizontal)
    }
    
    var friendRequestHeaderView: some View {
        HStack(spacing: 15) {
            FutbolyBackButton { Router.shared.popViewController() }
            Text("Friend Requests").font(.system(size: 26, weight: .semibold))
            Spacer()
        }.padding(.horizontal)
    }
}

#Preview {
    FriendsHeaderView(friendsScreenType: .existing)
}
