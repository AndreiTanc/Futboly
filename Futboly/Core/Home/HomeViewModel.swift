//
//  HomeViewModel.swift
//  Futboly
//
//  Created by Andrei Tanc on 12.11.2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var shouldPresentRewardAlert: Bool = false
    
    @Published var numberOfDailyGames: Int = 5
    @Published var numberOfWeeklyGames: Int = 6
}
