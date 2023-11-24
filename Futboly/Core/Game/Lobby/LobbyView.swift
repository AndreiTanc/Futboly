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
        FutbolyContainerView(backgroundImageName: "lobby") {
            content
        }
    }
    
    var content: some View {
        VStack(spacing: 20) {
            Text("Waiting time\n45 seconds")
                .multilineTextAlignment(.center)
                .font(.system(size: 32))
            Text("Waiting for a player to join the game")
                .font(.system(size: 16, weight: .regular))
            
            Button("Cancel", action: viewModel.cancelLobby)
                .buttonStyle(RoundedWhiteButton())
                .padding(.top, 15)
        }
    }
}

#Preview {
    LobbyView(viewModel: GameViewModel())
}
