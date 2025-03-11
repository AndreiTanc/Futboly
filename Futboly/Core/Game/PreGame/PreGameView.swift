//
//  PreGameView.swift
//  Futboly
//
//  Created by Andrei Tanc on 18.12.2023.
//

import SwiftUI

struct PreGameView: View {
    var body: some View {
        FutbolyContainerView(backgroundImageName: ImageName.preGame.rawValue) {
            contentView
        }
    }
    
    var contentView: some View {
        VStack(alignment: .center) {
            Text("Tap in the right time to get the perfect shot!")
                .font(.system(size: 32, weight: .semibold))
                .multilineTextAlignment(.center)
            
            Button {
                // action
            } label: {
                Text("Tap")
                    .foregroundStyle(.white)
                    .frame(width: 90, height: 90)
                    .background(Color.futbolyPink)
                    .clipShape(.circle)
            }

        }
    }
}

#Preview {
    PreGameView()
}
