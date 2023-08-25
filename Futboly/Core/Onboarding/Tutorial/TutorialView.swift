//
//  TutorialView.swift
//  Futboly
//
//  Created by Andrei Tanc on 24.08.2023.
//

import SwiftUI

struct TutorialView: View {
    @State var pageNumber: Int = 0
    
    var body: some View {
        ZStack {
            FutbolyGreenBackground()
            content
        }.navigationBarHidden(true)
    }
    
    var content: some View {
        VStack(spacing: 30) {
            Text("FUTBOLY").font(.system(size: 30)).fontWeight(.bold).foregroundColor(.white).padding(.top, 20)
            
            tutorialStepsCarouselView
            
            Button("How to play") {
                // action
            }.padding(.horizontal).padding(.vertical, 3)
            .background(Color.white)
            .foregroundColor(.futbolyDarkBlue)
            .clipShape(Capsule())
            
            Spacer()
            
            Button {
                Router.shared.goToScreen(withRoute: .login)
            } label: {
                Text("Let's play!").frame(maxWidth: .infinity)
            }.buttonStyle(RoundedDarkBlueButton())
        }.padding()
    }
    
    var tutorialStepsCarouselView: some View {
        VStack {
            TabView(selection: $pageNumber) {
                ForEach((0..<TutorialStepView.TutorialStep.allCases.count), id: \.self) { index in
                    TutorialStepView(tutorialStep: .init(rawValue: index) ?? .pickPlayers)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack(spacing: 5) {
                ForEach((0..<TutorialStepView.TutorialStep.allCases.count), id: \.self) { index in
                    Capsule()
                        .fill(index == pageNumber ? Color.futbolyDarkBlue : Color.futbolyDarkBlue.opacity(0.5))
                        .frame(width: index == pageNumber ? 30 : 10, height: 10)
                        .animation(.spring(), value: pageNumber)
                }
            }
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
