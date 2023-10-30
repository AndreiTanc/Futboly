//
//  RegisterViewModel.swift
//  Futboly
//
//  Created by Andrei Tanc on 19.08.2023.
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

class RegisterViewModel: ObservableObject {
    @Published var currentOnboardingType: OnboardingType = .signIn
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var teamName: String = ""
    
    func register() {
        
    }
    
    func forgotPassword() {
        Router.shared.goToScreen(withRoute: .forgotPassword)
    }
}
