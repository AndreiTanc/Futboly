//
//  LoginViewModel.swift
//  Futboly
//
//  Created by Andrei Tanc on 19.08.2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func login() {
        
    }
    
    func forgotPassword() {
        
    }
    
    func goToSignup() {
        Router.shared.goToScreen(withRoute: .signup)
    }
}
