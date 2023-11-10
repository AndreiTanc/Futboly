//
//  OnboardingType.swift
//  Futboly
//
//  Created by Andrei Tanc on 10.11.2023.
//

import Foundation

enum OnboardingType {
    case signIn
    case signUp
    
    var description: String {
        switch self {
        case .signIn:
            return "Sign In"
        case .signUp:
            return "Sign Up"
        }
    }
}
