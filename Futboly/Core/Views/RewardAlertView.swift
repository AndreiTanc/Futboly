//
//  RewardAlertView.swift
//  Futboly
//
//  Created by Andrei Tanc on 13.11.2023.
//

import SwiftUI

struct RewardAlertView: View {
    var dismissAction: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7).ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 15) {
                
                Text("You won 3 Daily Games!").font(.system(size: 32, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                Text("You earned 15 energies!").font(.system(size: 16))
                    .padding(.bottom)
                
                Button("Collect") {
                    dismissAction()
                }.buttonStyle(RoundedBlackButton())
            }
            .padding().padding(.top, 30)
            .background(Color.white)
            .clipShape(.rect(cornerRadius: 20))
            .overlay(
                overlayEnergyView
            )
            .padding()
        }.background(.clear)
    }
    
    var overlayEnergyView: some View {
        VStack {
            Image("thunder")
                .resizable()
                .frame(width: 66, height: 66)
                .background(.white).clipShape(.circle)
                .overlay(
                    RoundedRectangle(cornerRadius: 33)
                        .stroke(.white, lineWidth: 17)
                )
                .padding(.top, -35)
            
            Spacer()
        }
    }
}

#Preview {
    RewardAlertView(dismissAction: {})
}
