//
//  Color+Colors.swift
//  Futboly
//
//  Created by Andrei Tanc on 21.08.2023.
//

import Foundation
import SwiftUI

fileprivate enum ColorName: String {
    case lowerBackgroundGradient = "lower_background_gradient"
    case upperBackgroundGradient = "upper_background_gradient"
}

extension Color {
    static var lowerBackgroundGradient: Color { return .init(ColorName.lowerBackgroundGradient.rawValue) }
    static var upperBackgroundGradient: Color { return .init(ColorName.upperBackgroundGradient.rawValue) }
}
