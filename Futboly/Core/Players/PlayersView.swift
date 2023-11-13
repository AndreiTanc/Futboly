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
    
    var body: some View {
        VStack {
            ProfileHeaderView()
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
}

#Preview {
    PlayersView()
}
