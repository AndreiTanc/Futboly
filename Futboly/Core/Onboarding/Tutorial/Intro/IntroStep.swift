//
//  IntroStep.swift
//  Futboly
//
//  Created by Andrei Tanc on 18.09.2023.
//

import Foundation

enum IntroStep: Int, CaseIterable {
    case pickPlayers
    case properShoot
    case checkScore
    
    var imageName: String {
        switch self {
        case .pickPlayers:
            return ImageName.introPickPlayers.rawValue
        case .properShoot:
            return ImageName.introProperShoot.rawValue
        case .checkScore:
            return ImageName.introCheckScore.rawValue
        }
    }
    
    var title: String {
        switch self {
        case .pickPlayers:
            return "Pick your Top 5"
        case .properShoot:
            return "Proper shoot!"
        case .checkScore:
            return "Check your score"
        }
    }
    
    var details: String {
        switch self {
        case .pickPlayers:
            return "Before every match pick the best players for your team in a draft against your opponent."
        case .properShoot:
            return "Kick the ball in the right moment to get the best position in the initial draft."
        case .checkScore:
            return "Based on real games you can see the results and points of your Top 5 players."
        }
    }
    
    var quote: String {
        switch self {
        case .pickPlayers:
            return "Hurry up before time expires!"
        case .properShoot:
            return "You could start first!"
        case .checkScore:
            return "Who’s going to win?"
        }
    }
}
