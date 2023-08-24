//
//  FutbolyGreenBackground.swift
//  Futboly
//
//  Created by Andrei Tanc on 23.08.2023.
//

import SwiftUI

struct FutbolyGreenBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.upperBackgroundGradient, .lowerBackgroundGradient]),
            startPoint: .top,
            endPoint: .bottom
        ).ignoresSafeArea()
    }
}

struct FutbolyGreenBackground_Previews: PreviewProvider {
    static var previews: some View {
        FutbolyGreenBackground()
    }
}
