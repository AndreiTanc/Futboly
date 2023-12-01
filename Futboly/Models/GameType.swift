//
//  GameType.swift
//  Futboly
//
//  Created by Andrei Tanc on 22.11.2023.
//

import SwiftUI

enum GameType: String {
    case daily
    case weekly
    
    var title: String {
        switch self {
        case .daily: "Daily Games"
        case .weekly: "Weekend League"
        }
    }
    
    var cost: Int {
        switch self {
        case .daily: 1
        case .weekly: 3
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .daily: .lightBlue
        case .weekly: .lightYellow
        }
    }
}

enum OpponentType {
    case friends
    case `public`
    
    var title: String {
        switch self {
        case .friends: "Friends"
        case .public: "Public"
        }
    }
}
