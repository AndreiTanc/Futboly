//
//  LeaderboardView.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.10.2023.
//

import SwiftUI

struct LeaderboardView: View {
    @State var selectedOpponentType: OpponentType = .public
    @State var selectedGameType: GameType = .daily
    
    var body: some View {
        VStack(spacing: 20) {
            ProfileHeaderView()
            PublicFriendMatchesSwitch(selectedOpponentType: $selectedOpponentType)
            DailyWeeklySwitch(selectedGameType: $selectedGameType)
            
            Spacer()
        }.padding(.horizontal)
    }
}

#Preview {
    LeaderboardView()
}
