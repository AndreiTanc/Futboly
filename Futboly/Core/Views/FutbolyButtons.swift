//
//  FutbolyButtons.swift
//  Futboly
//
//  Created by Andrei Tanc on 23.08.2023.
//

import SwiftUI

struct RoundedBlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.futbolyBlue)
            .foregroundStyle(.white)
            .fontWeight(.bold)
            .font(.system(size: 20))
            .clipShape(Capsule())
    }
}
