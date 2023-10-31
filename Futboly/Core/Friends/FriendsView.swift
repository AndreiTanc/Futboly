//
//  FriendsView.swift
//  Futboly
//
//  Created by Andrei Tanc on 31.10.2023.
//

import SwiftUI

struct FriendsView: View {
    @ObservedObject private(set) var viewModel: FriendsViewModel = FriendsViewModel()
    
    var body: some View {
        ZStack {
            Color.lightGray.ignoresSafeArea()
            // should check if friends available, if not, do not display white
            Color.white.padding(.top, 200).ignoresSafeArea()
            ScrollView {
                LazyVStack(spacing: 30) {
                    headerView
                    friendsList
                }
            }
        }
    }
    
    var headerView: some View {
        HStack(alignment: .center) {
            FutbolyBackButton { Router.shared.popViewController() }
            Spacer()
            Spacer()
            
            Text("My Friends")
                .font(.system(size: 28, weight: .semibold))
            Spacer()
            
            Button {
                viewModel.inviteFriend()
            } label: {
                Text("Invite new").foregroundStyle(.black).fontWeight(.medium)
            }
        }.padding(.horizontal)
    }
    
    var friendsList: some View {
        LazyVStack(spacing: 15) {
            ForEach((1...4), id: \.self) { index in
                FriendRowView()
            }
        }.padding()
        .background(.white)
        .clipShape(.rect(cornerRadius: 24))
    }
}

#Preview {
    FriendsView()
}
