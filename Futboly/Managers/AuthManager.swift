//
//  AuthManager.swift
//  Futboly
//
//  Created by Andrei Tanc on 10.11.2023.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class AuthManager {
    static var shared: AuthManager = AuthManager()
    private init() {}
    
    var isUserAuthenticated: Bool {
        Auth.auth().currentUser?.uid != nil
    }
    
    // MARK: - Sign in with Email and Password
    
    func signin(with email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            completion(error)
        }
    }
    
    func signup(email: String, password: String, teamName: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            completion(error)
        }
    }
    
    // MARK: - Sign in with Google Account

    func performGoogleAccountSignIn(completion: @escaping (Error?) -> Void) {
        guard let viewController = Router.shared.topViewController else { return }
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        // TODO: Move configuration to Info.plist
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: viewController) { [unowned self] result, error in
            guard error == nil else { completion(error); return }
            
            guard let user = result?.user, let idToken = user.idToken?.tokenString else {
                let error = NSError(
                    domain: "GIDSignInError",
                    code: -1,
                    userInfo: [
                        NSLocalizedDescriptionKey: "Unexpected sign in result: required authentication data is missing.",
                    ]
                )
                completion(error)
                return
            }
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            
            // Rather than use the credential to sign in the user, we will use it to link to the currently signed in user's account.
            signIn(authCredential: credential, completion: completion)
        }
    }
    
    private func signIn(authCredential: AuthCredential, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(with: authCredential) { result, error in
            guard error == nil else { completion(error); return }
            completion(nil)
        }
    }
}
