//
//  TutorialPointsInformation.swift
//  Futboly
//
//  Created by Andrei Tanc on 14.10.2023.
//

import Foundation

protocol TutorialPointsInfo {
    var title: String { get }
    var points: Int { get }
    var imageName: String { get }
}

enum EarnPointsInfo: TutorialPointsInfo, CaseIterable {
    case goal
    case defenderGoalkeeperGoal
    case assist
    case penaltySaveByGoalkeeper
    
    var title: String {
        return switch self {
        case .goal: "Goal"
        case .defenderGoalkeeperGoal: "Defender/Goalkeeper Goal"
        case .assist: "Assist"
        case .penaltySaveByGoalkeeper: "Penalty Save by the Goalkeeper"
        }
    }
    
    var points: Int {
        return switch self {
        case .goal: 5
        case .defenderGoalkeeperGoal: 10
        case .assist: 10
        case .penaltySaveByGoalkeeper: 5
        }
    }
    
    var imageName: String {
        return switch self {
        case .goal: ImageName.goal.rawValue
        case .defenderGoalkeeperGoal: ImageName.defenderGoalkeeperGoal.rawValue
        case .assist: ImageName.assist.rawValue
        case .penaltySaveByGoalkeeper: ImageName.penaltySaveGoalkeeper.rawValue
        }
    }
}

enum LosePointsInfo: TutorialPointsInfo, CaseIterable {
    case yellowCard
    case redCard
    case penaltyMiss
    case ownGoal
    case goalConcededByGoalkeeper
    
    var title: String {
        return switch self {
        case .yellowCard: "Yellow Card"
        case .redCard: "Red Card"
        case .penaltyMiss: "Penalty Miss"
        case .ownGoal: "Own Goal"
        case .goalConcededByGoalkeeper: "Goal Conceded by Goalkeeper"
        }
    }
    
    var points: Int {
        return switch self {
        case .yellowCard: 1
        case .redCard: 2
        case .penaltyMiss: 3
        case .ownGoal: 3
        case .goalConcededByGoalkeeper: 3
        }
    }
    
    var imageName: String {
        return switch self {
        case .yellowCard: ImageName.yellowCard.rawValue
        case .redCard: ImageName.redCard.rawValue
        case .penaltyMiss: ImageName.penaltyMiss.rawValue
        case .ownGoal: ImageName.ownGoal.rawValue
        case .goalConcededByGoalkeeper: ImageName.ownGoal.rawValue
        }
    }
}
