//
//  HowToPlayIntroductoryView.swift
//  Futboly
//
//  Created by Andrei Tanc on 14.10.2023.
//

import SwiftUI

struct HowToPlayIntroductoryView: View {
    let alertDescription = "Futboly is an exciting mobile app that allows you to put your football knowledge to the test by playing against other users. Here's a concise tutorial on how to play:"
    
    var body: some View {
        ZStack {
            backgroundView.blur(radius: 7)
            
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            FutbolyAlert(description: alertDescription, buttonTitle: "Continue") {
                Router.shared.goToScreen(withRoute: .tutorial)
            }
        }
    }
    
    var backgroundView: some View {
        ZStack {
            Image("launch_illustration")
                .resizable()
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(contentMode: .fill)
            
            VStack(alignment: .center) {
                Image("futboly_white")
                Text("Your Team. Your Way.").foregroundStyle(.white)
                Spacer()
            }.padding(.top, 150)
        }
    }
}

#Preview {
    HowToPlayIntroductoryView()
}
