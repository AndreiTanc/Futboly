//
//  HomeGamesView.swift
//  Futboly
//
//  Created by Andrei Tanc on 22.11.2023.
//

import SwiftUI

struct HomeGamesView: View {
    var gameType: GameType
    @State var shouldShowAllGames: Bool = false
    
    var body: some View {
        LazyVStack(spacing: 20) {
            HStack {
                VStack(alignment: .leading) {
                    Text(gameType.title).fontWeight(.semibold)
                    Text("07 August").font(.system(size: 14, weight: .regular)).foregroundStyle(.gray)
                }
                
                Spacer()
                
                JoinGameButton(cost: gameType.cost) {
                    // action
                }
            }
            
            ForEach(1...3, id: \.self) { _ in
                VStack {
                    GameRowView()
                    Divider()
                }
            }
            
            if shouldShowAllGames {
                ForEach(4...6, id: \.self) { _ in
                    VStack {
                        GameRowView()
                        Divider()
                    }
                }
            }
            
            Button(shouldShowAllGames ? "Hide" : "Show More") {
                withAnimation {
                    shouldShowAllGames.toggle()
                }
            }.foregroundStyle(.black)
            .font(.system(size: 15, weight: .semibold))
            .padding(.top, -5)
            
        }.padding()
        .background(gameType.backgroundColor)
        .clipShape(.rect(cornerRadius: 24))
    }
}

#Preview {
    HomeGamesView(gameType: .daily)
}
