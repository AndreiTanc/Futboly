//
//  HomeView.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.10.2023.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    @ObservedObject private(set) var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            ProfileHeaderView()
            
            ScrollView {
                Button("Present alert") {
                    viewModel.shouldPresentRewardAlert = true
                }
                
                LazyVStack(spacing: 20) {
                    HomeGamesView(gameType: .daily, gameAction: viewModel.presentCardPopup(forGameType:))
                    HomeGamesView(gameType: .weekly, gameAction: viewModel.presentCardPopup(forGameType:))
                }
            }.scrollIndicators(.never)
            
            Spacer()
        }
        .padding(.horizontal)
        .fullScreenCover(isPresented: $viewModel.shouldPresentRewardAlert) {
            RewardAlertView(dismissAction: {
                viewModel.shouldPresentRewardAlert = false
            }).background(ClearBackground())
        }
        .fullScreenCover(item: $viewModel.bottomCardPopupType) { cardType in
            let gameType: GameType = cardType == .dailyGames ? .daily : .weekly
            BottomCardPopupView(cardType: cardType) {
                viewModel.startGame(gameType, withOpponentType: .public)
            } secondButtonAction: {
                viewModel.startGame(gameType, withOpponentType: .friends)
            } dismiss: {
                viewModel.dismissBottomCard()
            }
            .background(ClearBackground())
        }
    }
}

#Preview {
    HomeView()
}
