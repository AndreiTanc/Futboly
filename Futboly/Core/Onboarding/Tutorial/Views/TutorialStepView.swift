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
        VStack(alignment: .center, spacing: 10) {
            Text(tutorialStep.title).fontWeight(.bold).font(.system(size: 30)).padding(.bottom)
            Text(tutorialStep.details).multilineTextAlignment(.center)
            Text(tutorialStep.quote)
        }
    }
}

struct TutorialStepView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialStepView(tutorialStep: .pickPlayers)
    }
}
