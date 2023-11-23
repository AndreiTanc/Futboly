//
//  ProfileView.swift
//  Futboly
//
//  Created by Andrei Tanc on 21.11.2023.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject private(set) var viewModel: ProfileViewModel
    
    var body: some View {
        ZStack {
            Color.lightGray.ignoresSafeArea()
            VStack(spacing: 30) {
                FutbolyNavHeaderView(title: "Team", buttonTitle: "Share") {
                    // share action
                }
                profileView.padding(.horizontal)
            }
        }
    }
    
    var profileView: some View {
        ScrollView {
            LazyVStack(alignment: .center, spacing: 15) {
                profileHeader
            }
            .padding()
        }.background(.white)
        .clipShape(.rect(cornerRadius: 24))
    }
    
    var profileHeader: some View {
        LazyVStack(alignment: .center) {
            FutbolyAsyncImage(imageUrlString: viewModel.user.profileImageURL, size: 80)
            Text(viewModel.user.teamName).font(.system(size: 24))
            HStack {
                Text(CountryManager.shared.currentUserFlag())
                Text(viewModel.user.country).font(.system(size: 14)).foregroundStyle(Color.gray)
            }
            HStack(spacing: 3) {
                Image(.upBlackArrow)
                Text("\(viewModel.user.bestScore)").fontWeight(.semibold)
                    .padding(.trailing, 10)
                
                Image(.achievments)
                Text("\(viewModel.user.numberOfWins)").fontWeight(.semibold)
                    .padding(.trailing, 10)
            }
            
            Button("Play a match", action: viewModel.playMatch)
                .buttonStyle(PinkRoundedButton())
                .padding(.vertical, 10)
        }
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel(user: .init(fromDict: [:])))
}
