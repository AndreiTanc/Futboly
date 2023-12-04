//
//  PlayerRowView.swift
//  Futboly
//
//  Created by Andrei Tanc on 04.12.2023.
//

import SwiftUI

struct PlayerRowView: View {
    var body: some View {
        HStack(spacing: 10) {
            playerImageNameView
            Spacer(minLength: 0)
            
            Text("6.5").font(.system(size: 12))
            Text("8.2").font(.system(size: 12))
            Text("JUV").font(.system(size: 12))
            Text("43").font(.system(size: 12))
            
            Image(.favouriteStar)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16)
        }
        .padding()
        .background(Color.lightGray)
        .clipShape(.rect(cornerRadius: 16))
    }
    
    var playerImageNameView: some View {
        HStack {
            Image(.playerDefault)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 35)
                .background(Color.lightBlue)
                .clipShape(.circle)
            
            Text("Player Name").fontWeight(.semibold)
        }
    }
}

#Preview {
    PlayerRowView()
}
