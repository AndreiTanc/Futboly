//
//  PlayersView.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.10.2023.
//

import SwiftUI

struct PlayersView: View {
    @State var isFavoriteSelected: Bool = false
    @State var selectedGameType: GameType = .daily
    @State var listViewMode: PlayersList.ListViewMode = .grid
    
    var body: some View {
        VStack(spacing: 20) {
            ProfileHeaderView()
            DailyWeeklySwitch(selectedGameType: $selectedGameType).padding(.vertical, 8)
            playersFilteringHeader
            listViewModeSelectorView
            PlayersList(viewMode: $listViewMode)
            Spacer()
        }.padding(.horizontal)
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
    
    var listViewModeSelectorView: some View {
        HStack(spacing: 15) {
            Text("View Mode")
            Spacer()
            
            Button {
                listViewMode = .grid
            } label: {
                Image(listViewMode == .grid ? .gridSelected : .gridUnselected)
            }

            Button {
                listViewMode = .list
            } label: {
                Image(listViewMode == .list ? .listSelected : .listUnselected)
            }
        }
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
