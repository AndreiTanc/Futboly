//
//  IntroView.swift
//  Futboly
//
//  Created by Andrei Tanc on 24.08.2023.
//

import SwiftUI

struct IntroView: View {
    @State var pageNumber: Int = 0
    
    var body: some View {
        ZStack {
            imageView.ignoresSafeArea(edges: .top)
            content
        }
    }
    
    var imageView: some View {
        VStack {
            Image((IntroStep(rawValue: pageNumber) ?? .pickPlayers).imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .animation(.spring(), value: pageNumber)
            Spacer()
        }
    }
    
    var content: some View {
        VStack {
            Spacer()
            cardView
                .background(.white)
                .clipShape(.rect(topLeadingRadius: 30, topTrailingRadius: 30))
        }
    }
    
    var cardView: some View {
        VStack {
            HStack(spacing: 5) {
                ForEach((0..<IntroStep.allCases.count), id: \.self) { index in
                    Capsule()
                        .fill(index == pageNumber ? Color.black : Color.black.opacity(0.5))
                        .frame(width: index == pageNumber ? 30 : 10, height: 10)
                        .animation(.spring(), value: pageNumber)
                }
            }.padding(.top, 30)
            
            TabView(selection: $pageNumber) {
                ForEach((0..<IntroStep.allCases.count), id: \.self) { index in
                    IntroStepView(introStep: .init(rawValue: index) ?? .pickPlayers)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)).frame(height: 200)
            
            buttonsView
        }.padding(.horizontal, 20).padding(.bottom)
    }
    
    var buttonsView: some View {
        HStack {
            Button("How to play") {
                Router.shared.goToScreen(withRoute: .howToPlay)
            }.buttonStyle(RoundedWhiteButton())
            
            Spacer()
            
            Button("Let's start!") {
                Router.shared.goToScreen(withRoute: .register)
            }.buttonStyle(RoundedBlackButton())
        }.padding(.horizontal, 8)
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}
