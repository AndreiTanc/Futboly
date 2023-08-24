//
//  SignupViewModel.swift
//  Futboly
//
//  Created by Andrei Tanc on 23.08.2023.
//

import Foundation

class SignupViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmedPassword: String = ""
    @Published var teamName: String = ""
    
    func signup() {
        
    }
    
    func goBackToLogin() {
        Router.shared.popViewController()
    }
}
