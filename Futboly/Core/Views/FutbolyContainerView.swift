//
//  FutbolyContainerView.swift
//  Futboly
//
//  Created by Andrei Tanc on 24.11.2023.
//

import SwiftUI

struct FutbolyContainerView<Content: View>: View {
    var backgroundImageName: String
    @ViewBuilder let content: Content
    
    var body: some View {
        ZStack {
            backgroundView.ignoresSafeArea(edges: .top)
            cardView
        }
    }
    
    var backgroundView: some View {
        VStack {
            Image(backgroundImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Spacer()
        }
    }
    
    var cardView: some View {
        VStack {
            Spacer()
            content
                .frame(maxWidth: .infinity)
                .padding()
                .padding(.vertical, 20)
                .background(.white)
                .clipShape(.rect(topLeadingRadius: 30, topTrailingRadius: 30))
        }
    }
}
