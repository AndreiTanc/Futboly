//
//  TutorialStep.swift
//  Futboly
//
//  Created by Andrei Tanc on 14.10.2023.
//

import Foundation

enum TutorialStep: Int, CaseIterable {
    case teamFormation
    case playerDraft
    case playerPoints
    case matchUpdates
    case leadershipBoard
    case dailyMatches
    case weekendLeague
    
    var title: String {
        switch self {
        case .teamFormation:
            return "Team Formation"
        case .playerDraft:
            return "Player Draft"
        case .playerPoints:
            return "Player Bonuses and Deductions"
        case .matchUpdates:
            return "Match Updates"
        case .leadershipBoard:
            return "Leadership Board"
        case .dailyMatches:
            return "Daily Matches"
        case .weekendLeague:
            return "Weekend League"
        }
    }
    
    var description: String {
        switch self {
        case .teamFormation:
            return "Each match consists of two users, and both will draft 5 football players to form their teams.\n\nYour team must include a Goalkeeper, Defender, Midfielder, and Striker.\n\nThe 5th spot goes to the Captain, whose bonuses and penalties are multiplied."
        case .playerDraft:
            return "Both users connect simultaneously to draft players based on their values.\n\nThe user with the lower team value gets the next pick. Choose wisely, as your team's performance hinges on your selections."
        case .playerPoints:
            return "In the real matches, your selected players' actual performance matters."
        case .matchUpdates:
            return "Sit back and watch as real football matches unfold during the day or over the weekend. Futboly reflects the actual scores of your selected players in your game results."
        case .leadershipBoard:
            return "Keep an eye on the Leadership board to see where you stand among all other users. It's a chance to prove your football prowess and compete with the best."
        case .dailyMatches:
            return "You can use players from 2 to max 4 real matches of the day. Entry costs 1 Energy. If you win, you earn 5 Energies. If you tie, you get back 1 Energy, and in case of a loss, you'll receive 0 Energies."
        case .weekendLeague:
            return "Prepare your teams for the weekend from 6 to max 10 real matches of the weekend. Entry requires 3 Energies. If you win, you'll earn 10 Energies. In the event of a tie, you'll get 3 Energies back, and even if you lose, you'll still recover 1 Energy."
        }
    }
}
