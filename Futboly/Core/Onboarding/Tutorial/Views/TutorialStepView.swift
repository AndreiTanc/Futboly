//
//  TutorialStepView.swift
//  Futboly
//
//  Created by Andrei Tanc on 24.08.2023.
//

import SwiftUI

struct TutorialStepView: View {
    var tutorialStep: TutorialStep
    
    var body: some View {
        VStack(spacing: 20) {
            Image(tutorialStep.imageName)
            Text(tutorialStep.title).fontWeight(.bold).font(.system(size: 30)).foregroundColor(.white)
            Text(tutorialStep.details).font(.system(size: 20)).foregroundColor(.white).multilineTextAlignment(.center)
        }
    }
}

struct TutorialStepView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialStepView(tutorialStep: .pickPlayers)
    }
}

extension TutorialStepView {
    enum TutorialStep: Int, CaseIterable {
        case pickPlayers
        case properShoot
        case checkScore
        
        var imageName: String {
            switch self {
            case .pickPlayers:
                return ImageName.tutorialPickPlayers.rawValue
            case .properShoot:
                return ImageName.tutorialProperShoot.rawValue
            case .checkScore:
                return ImageName.tutorialCheckScore.rawValue
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
                return "Before every match pick the best players for your team in a draft against your opponent. Hurry up before time expires!"
            case .properShoot:
                return "Kick the ball in the right moment to get the best position in the initial draft. You could start first!"
            case .checkScore:
                return "Based on real games you can see the results and points of your Top 5 players. Who’s going to win?"
            }
        }
    }
}
