//
//  PlayersList.swift
//  Futboly
//
//  Created by Andrei Tanc on 04.12.2023.
//

import SwiftUI

struct PlayersList: View {
    @Binding var viewMode: ListViewMode
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let cellSpacing: CGFloat = 6
    
    var body: some View {
        switch viewMode {
        case .grid:
            playersGrid
        case .list:
            playersList
        }
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
    
    var playersList: some View {
        ScrollView {
            LazyVStack {
                ForEach(0...7, id: \.self) { _ in
                    PlayerRowView()
                }
            }
        }.scrollIndicators(.hidden)
    }
}

#Preview {
    PlayersList(viewMode: .constant(.grid))
}

extension PlayersList {
    enum ListViewMode {
        case grid
        case list
    }
}
