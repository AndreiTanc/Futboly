//
//  PlayerCellView.swift
//  Futboly
//
//  Created by Andrei Tanc on 13.11.2023.
//

import SwiftUI

struct PlayerCellView: View {
    var body: some View {
        ZStack {
            Image(.playerDefault)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.bottom, 35)
            
            VStack(alignment: .leading) {
                Image(.teamDefault)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 38)
                    .padding(.bottom, 5)
                
                HStack {
                    Text("6.9")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(.black)
                        .padding(6)
                        .background(.white)
                        .clipShape(.circle)
                    Spacer()
                    Text("42")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding(6)
                        .background(.black)
                        .clipShape(.circle)
                }
                
                Spacer()
                
                Text("Rodrygo Goes")
                    .padding(10)
                    .lineLimit(1)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .background(.white)
                    .clipShape(.capsule)
            }
        }.padding(5)
        .background(Color.lightBlue)
        .clipShape(.rect(cornerRadius: 24))
    }
}

#Preview {
    PlayerCellView()
}
