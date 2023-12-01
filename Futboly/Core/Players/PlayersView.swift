//
//  PlayersView.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.10.2023.
//

import SwiftUI

struct PlayersView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let cellSpacing: CGFloat = 6
    
    @State var isFavoriteSelected: Bool = false
    @State var selectedGameType: GameType = .daily
    
    var body: some View {
        VStack(spacing: 20) {
            ProfileHeaderView()
            DailyWeeklySwitch(selectedGameType: $selectedGameType).padding(.vertical, 8)
            playersFilteringHeader
            playersGrid
            Spacer()
        }.padding(.horizontal)
    }
    
    var playersGrid: some View {
        GeometryReader { geo in
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: cellSpacing) {
                    ForEach(0...7, id: \.self) { _ in
                        let cellWidth = (geo.size.width - cellSpacing) / 2
                        PlayerCellView()
                            .frame(width: cellWidth, height: cellWidth)
                    }
                }
            }.scrollIndicators(.hidden)
        }
    }
    
    var playersFilteringHeader: some View {
        HStack {
            Button {
                // action
            } label: {
                teamDropdownSelector.frame(maxWidth: .infinity)
            }
            
            Button {
                withAnimation {
                    isFavoriteSelected.toggle()
                }
            } label: {
                if isFavoriteSelected {
                    favouriteSelectedView
                } else {
                    favouriteSelector.frame(maxWidth: .infinity)
                }
                
            }
        }.frame(maxWidth: .infinity)
    }
    
    var teamDropdownSelector: some View {
        HStack {
            Image(.teamDefault)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 30)
                .padding(.bottom, 5)
            
            if !isFavoriteSelected {
                Spacer()
            }
            Text("Real Madrid")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(Color.black)
            Spacer()
            
            Image(.dropdown)
        }.padding()
        .background(Color.lightGray)
        .frame(height: 50)
        .clipShape(.capsule)
    }
    
    var favouriteSelector: some View {
        HStack {
            Spacer()
            Image(.favouriteStar)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 24)
            Spacer()
            
            Text("My Favorites")
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(Color.black)
            Spacer()
        }.padding()
        .background(Color.lightGray)
        .frame(height: 50)
        .clipShape(.capsule)
    }
    
    var favouriteSelectedView: some View {
        Image(.favoriteSelected)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 35)
    }
}

#Preview {
    PlayersView()
}
