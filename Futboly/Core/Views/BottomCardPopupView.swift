//
//  BottomCardPopupView.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.11.2023.
//

import SwiftUI

struct BottomCardPopupView: View {
    @State var cardType: CardPopupType
    
    var firstButtonAction: () -> Void
    var secondButtonAction: () -> Void
    var dismiss: () -> Void
    
    @State private var backgorundOpacity: Double = 0
    
    var body: some View {
        ZStack {
            Color.black
                .opacity(backgorundOpacity).ignoresSafeArea()
                .onTapGesture { dismiss() }
            
            VStack {
                Spacer()
                cardContent
            }
        }.ignoresSafeArea(edges: .bottom)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.5)) {
                backgorundOpacity = 0.7
            }
        }
        .onDisappear {
            withAnimation(.easeInOut(duration: 0.5)) {
                backgorundOpacity = 0
            }
        }
    }
    
    var cardContent: some View {
        VStack {
            Image(.ball)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 40)
                .padding(.bottom, 20)
            
            Text(cardType.title).font(.system(size: 32, weight: .semibold))
            Text(cardType.subtitle).padding(.bottom, 15)
            
            HStack {
                Button(cardType.firstButtonTitle, action: {
                    firstButtonAction()
                    dismiss()
                }).buttonStyle(GrayRoundedButton())
                Button(cardType.secondButtonTitle, action: {
                    secondButtonAction()
                    dismiss()
                }).buttonStyle(GrayRoundedButton())
            }.frame(maxWidth: .infinity)
        }
        .padding()
        .padding(.vertical, 20)
        .background(.white)
        .clipShape(.rect(cornerRadius: 16))
    }
}

#Preview {
    BottomCardPopupView(cardType: .dailyGames, firstButtonAction: {}, secondButtonAction: {}, dismiss: {})
}

enum CardPopupType: Identifiable {
    case dailyGames
    case weeklyGames
    case friendlyMatch
    
    var id: String {
        title
    }
    
    var title: String {
        switch self {
        case .dailyGames: "Daily Games"
        case .weeklyGames: "Weekly Games"
        case .friendlyMatch: "Friendly Matches"
        }
    }
    
    var subtitle: String {
        switch self {
        case .dailyGames: "7 August"
        case .weeklyGames: "7 August"
        case .friendlyMatch: "You challenge a player to a match, select the type of match, and wait for the player to respond"
        }
    }
    
    var firstButtonTitle: String {
        switch self {
        case .dailyGames, .weeklyGames: "Public Game"
        case .friendlyMatch: "Daily Game"
        }
    }
    
    var secondButtonTitle: String {
        switch self {
        case .dailyGames, .weeklyGames: "Friends Game"
        case .friendlyMatch: "Weekend League"
        }
    }
}
