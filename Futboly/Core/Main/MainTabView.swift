//
//  MainTabView.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.10.2023.
//

import SwiftUI

struct MainTabView: View {
    @State var selectedTab: Int = 2
    
    var body: some View {
        TabView(selection: $selectedTab) {
            PlayersView()
                .tabItem {
                    Image(selectedTab == 0 ? .playersSelected : .players)
                }.tag(0)
            
            GamesView()
                .tabItem { Image(.games)  }
                .tag(1)
            
            HomeView()
                .tabItem {
                    Image(selectedTab == 2 ? .homeSelected : .home)
                }.tag(2)
            
            LeaderboardView()
                .tabItem {
                    Image(selectedTab == 3 ? .leaderboardSelected : .leaderboard)
                }.tag(3)
            
            AccountView()
                .tabItem { 
                    Image(selectedTab == 4 ? .tabProfileSelected : .tabProfile)
                }.tag(4)
        }
    }
}

#Preview {
    MainTabView()
}
