//
//  PlayerCellView.swift
//  Futboly
//
//  Created by Andrei Tanc on 13.11.2023.
//

import SwiftUI

struct PlayerCellView: View {
    @State var isSelected: Bool = false
    
    var body: some View {
        ZStack {
            playerImageBackground
            playerStatisticsView
            playerSelectionView.opacity(isSelected ? 1 : 0)
        }
        .padding(5)
        .background(isSelected ? Color.lightGray : Color.lightBlue)
        .clipShape(.rect(cornerRadius: 24))
        .onTapGesture { isSelected.toggle() }
    }
    
#warning("make image black and white with some filter if is player selected")
    var playerImageBackground: some View {
        Image(.playerDefault)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, 35)
    }
    
    var playerStatisticsView: some View {
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
    }
    
    var playerSelectionView: some View {
        VStack {
            HStack {
                Spacer()
                Image(.checkSelected)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 25)
            }
            Spacer()
        }.padding(5)
    }
}

#Preview {
    PlayerCellView()
}
