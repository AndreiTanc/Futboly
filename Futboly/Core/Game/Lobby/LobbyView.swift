//
//  LobbyView.swift
//  Futboly
//
//  Created by Andrei Tanc on 24.11.2023.
//

import SwiftUI

struct LobbyView: View {
    @ObservedObject private(set) var viewModel: GameViewModel
    
    var body: some View {
        FutbolyContainerView(backgroundImageName: viewModel.shouldShowPlayersNotFound ? "empty_lobby" : "lobby") {
            if viewModel.shouldShowPlayersNotFound {
                playersNotFoundContent
            } else {
                lobbyContent
            }
        }
        .onAppear {
            // should change after 45 secs and if there are no users
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                withAnimation(.easeInOut(duration: 0.5)) {
                    viewModel.shouldShowPlayersNotFound = true
                    // here we should also cancel the lobby
                }
            })
        }
    }
    
    var lobbyContent: some View {
        VStack(spacing: 20) {
            Text("Waiting time\n45 seconds")
                .multilineTextAlignment(.center)
                .font(.system(size: 32))
            Text("Waiting for a player to join the game")
                .font(.system(size: 16, weight: .regular))
            
            Button("Cancel", action: viewModel.exitLobby)
                .buttonStyle(RoundedWhiteButton())
                .padding(.top, 15)
        }
    }
    
    var playersNotFoundContent: some View {
        VStack(spacing: 20) {
            Text("Players not found")
                .multilineTextAlignment(.center)
                .font(.system(size: 32))
            Text("We are sorry, but the players were\nnot found, please try again")
                .font(.system(size: 16, weight: .regular))
            
            Button("Try Again", action: viewModel.tryAgain)
                .buttonStyle(RoundedWhiteButton())
                .padding(.top, 15)
            
            Button("Exit Lobby", action: viewModel.exitLobby)
                .buttonStyle(RoundedWhiteButton())
                .padding(.top, 15)
        }
    }
}

#Preview {
    LobbyView(viewModel: GameViewModel(gameType: .daily))
}
