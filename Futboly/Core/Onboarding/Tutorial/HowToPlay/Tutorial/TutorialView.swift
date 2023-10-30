//
//  TutorialView.swift
//  Futboly
//
//  Created by Andrei Tanc on 14.10.2023.
//

import SwiftUI

struct TutorialView: View {
    @State var pageNumber: Int = 0
    
    var body: some View {
        ZStack {
            Color.darkPurple.ignoresSafeArea()
            imageView.ignoresSafeArea(edges: .top)
            
            VStack {
                Spacer()
                cardView
            }
        }
    }
    
    var imageView: some View {
        VStack {
            Image(ImageName.introPickPlayers.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
        }
    }
    
    var cardView: some View {
        VStack(spacing: 20) {
            TabView(selection: $pageNumber) {
                ForEach((0..<TutorialStep.allCases.count), id: \.self) { index in
                    VStack {
                        Spacer()
                        TutorialStepView(tutorialStep: TutorialStep(rawValue: index) ?? .teamFormation)
                            .padding(20)
                            .background(Color.darkPurple)
                            .clipShape(.rect(topLeadingRadius: 30, topTrailingRadius: 30))
                    }
                }
            }.tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.spring, value: pageNumber)
            
            buttonsView
        }.padding(.bottom)
    }
    
    var buttonsView: some View {
        HStack(spacing: 50) {
            if pageNumber != 0 {
                Button {
                    pageNumber -= 1
                } label: {
                    Image(ImageName.leftWhiteArrow.rawValue)
                }.buttonStyle(TutorialStepButton())
            }
            
            Button {
                if pageNumber + 1 == TutorialStep.allCases.count {
                    Router.shared.goToScreen(withRoute: .register)
                    return
                }
                pageNumber += 1
            } label: {
                Image(ImageName.rightWhiteArrow.rawValue)
            }.buttonStyle(TutorialStepButton())
        }
    }
}

#Preview {
    TutorialView()
}
