//
//  AuthManager.swift
//  Futboly
//
//  Created by Andrei Tanc on 10.11.2023.
//

import Foundation
import FirebaseAuth

class AuthManager {
    static var shared: AuthManager = AuthManager()
    private init() {}
    
    var isUserAuthenticated: Bool {
        Auth.auth().currentUser?.uid != nil
    }
    
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
}
