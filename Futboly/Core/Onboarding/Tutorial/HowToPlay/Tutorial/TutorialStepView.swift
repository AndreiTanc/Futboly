//
//  TutorialStepView.swift
//  Futboly
//
//  Created by Andrei Tanc on 14.10.2023.
//

import SwiftUI

struct TutorialStepView: View {
    var tutorialStep: TutorialStep
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text(tutorialStep.title)
                    .foregroundStyle(.white)
                    .font(.system(size: 28, weight: .semibold))
                    .lineLimit(2, reservesSpace: tutorialStep == .playerPoints)
                Spacer(minLength: 30)
                HStack(spacing: 0) {
                    Text("\(tutorialStep.rawValue + 1)")
                        .foregroundStyle(.white)
                        .font(.system(size: 28, weight: .semibold))
                    Text("/\(TutorialStep.allCases.count)")
                        .foregroundStyle(.gray)
                        .padding(.top, 5)
                        .font(.system(size: 22))
                }
            }
            
            Text(tutorialStep.description)
                .foregroundStyle(.white)
            
            if tutorialStep == .playerPoints {
                playerPointsInformationView
            }
        }
    }
    
    var playerPointsInformationView: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("Earn points for:")
                
                ForEach(EarnPointsInfo.allCases, id: \.self) { pointsInfo in
                    TutorialPointsInfoCell(pointsInfo: pointsInfo, type: .earn)
                }
            }
            
            VStack(alignment: .leading) {
                Text("Lose points for:")
                
                ForEach(LosePointsInfo.allCases, id: \.self) { pointsInfo in
                    TutorialPointsInfoCell(pointsInfo: pointsInfo, type: .lose)
                }
            }
        }
    }
}

#Preview {
    TutorialStepView(tutorialStep: .playerPoints)
}
