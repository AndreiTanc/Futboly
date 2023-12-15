//
//  HomeViewModel.swift
//  Futboly
//
//  Created by Andrei Tanc on 12.11.2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var shouldPresentRewardAlert: Bool = false
    @Published var bottomCardPopupType: CardPopupType?
    
    @Published var numberOfDailyGames: Int = 5
    @Published var numberOfWeeklyGames: Int = 6
    
    func presentCardPopup(forGameType gameType: GameType) {
        bottomCardPopupType = gameType == .daily ? .dailyGames : .weeklyGames
    }
    
    func startGame(_ gameType: GameType, withOpponentType opponentType: OpponentType) {
        let gameViewModel = GameViewModel(gameType: gameType)
        
        gameViewModel.searchLobby { successfulyJoinedLobby in
            if successfulyJoinedLobby {
                Router.shared.goToScreen(withRoute: .lobby(gameViewModel))
            } else {
                // present error at joining a lobby
            }
        }
    }
    
    func dismissBottomCard() {
        bottomCardPopupType = nil
    }
}
