//
//  RegisterViewModel.swift
//  Futboly
//
//  Created by Andrei Tanc on 19.08.2023.
//

import Foundation
import FirebaseAuth
import ProgressHUD

class RegisterViewModel: ObservableObject {
    @Published var currentOnboardingType: OnboardingType = .signIn
    @Published var shouldPresentAlert: Bool = false {
        didSet {
            if shouldPresentAlert == false { registerError = .none }
        }
    }
    var registerError: RegisterError = .none {
        didSet {
            if registerError != .none { shouldPresentAlert = true }
        }
    }
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var teamName: String = ""
    
    func register() {
        guard isValidEmail() else { registerError = .InvalidEmail; return }
        guard isValidPassword() else { registerError = .InvalidPassword; return }
        if currentOnboardingType == .signUp && !isValidTeamName() { registerError = .InvalidTeamName; return }
        
        ProgressHUD.animate()
        switch currentOnboardingType {
        case .signIn: 
            AuthManager.shared.signin(with: email, password: password, completion: loginDidOccur(_:_:))
        case .signUp:
            AuthManager.shared.signup(email: email, password: password, teamName: teamName, completion: loginDidOccur(_:_:))
        }
    }
    
    func facebookLogin() {
        AuthManager.shared.performFacebookAccountSignIn(completion: loginDidOccur(_:_:))
    }
    
    func googleLogin() {
        AuthManager.shared.performGoogleAccountSignIn(completion: loginDidOccur(_:_:))
    }
    
    func appleLogin() {
        #warning("Must do after we have apple account")
    }
    
    func loginDidOccur(_ error: Error?, _ email: String? = nil) {
        if let error {
            #warning("Should change to log later")
            print(error)
            registerError = .PoorConnection
            return
        }
        if let email { saveAccount(withEmail: email); return }
        ProgressHUD.dismiss()
        Router.shared.goToScreen(withRoute: .main)
    }
    
    private func saveAccount(withEmail email: String) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let user = User(id: userId, email: email, teamName: teamName)
        FirestoreManager.shared.saveUser(user) {
            ProgressHUD.dismiss()
            Router.shared.goToScreen(withRoute: .main)
        }
    }
    
    func forgotPassword() {
        Router.shared.goToScreen(withRoute: .forgotPassword)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword() -> Bool {
        password.trimmingCharacters(in: .whitespacesAndNewlines).count >= 6
    }
    
    func isValidTeamName() -> Bool {
        !teamName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

enum RegisterError: String {
    case InvalidEmail = "Email is not valid"
    case InvalidPassword = "Password is not valid. Must be minimum 6 characters."
    case InvalidTeamName = "Team name is empty"
    case PoorConnection = "There was a connection error, please try again!"
    case none
}
