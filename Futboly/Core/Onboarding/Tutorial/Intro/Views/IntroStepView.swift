//
//  IntroStepView.swift
//  Futboly
//
//  Created by Andrei Tanc on 24.08.2023.
//

import SwiftUI

struct IntroStepView: View {
    var introStep: IntroStep
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(introStep.title).fontWeight(.bold).font(.system(size: 30)).padding(.bottom)
            Text(introStep.details).multilineTextAlignment(.center)
            Text(introStep.quote)
        }
    }
}

struct IntroStepView_Previews: PreviewProvider {
    static var previews: some View {
        IntroStepView(introStep: .pickPlayers)
    }
}
