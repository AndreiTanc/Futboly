//
//  HomeView.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.10.2023.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    var body: some View {
        Button("logout") {
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                FutbolyVault.shared.reset()
                Router.shared.reloadFlowFromRegister()
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
        }
    }
}

#Preview {
    HomeView()
}
