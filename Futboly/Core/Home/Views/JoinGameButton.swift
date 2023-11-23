//
//  JoinGameButton.swift
//  Futboly
//
//  Created by Andrei Tanc on 21.11.2023.
//

import SwiftUI

struct JoinGameButton: View {
    var cost: Int
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text("Join").font(.system(size: 16, weight: .semibold)).foregroundStyle(.white)
                
                HStack(spacing: 5) {
                    Image(.littleThunder)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 10)
                    
                    Text("\(cost)")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.white)
                }
                .padding(2).padding(.horizontal, 6)
                .background(Color.futbolyPink)
                .clipShape(.capsule)
            }
            .padding(8).padding(.horizontal, 5)
            .background(.black)
            .clipShape(.capsule)
        }
    }
}

#Preview {
    JoinGameButton(cost: 1)
}
