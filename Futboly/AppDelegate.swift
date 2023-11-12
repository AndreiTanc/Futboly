//
//  AppDelegate.swift
//  Futboly
//
//  Created by Andrei Tanc on 07.07.2023.
//

import UIKit
import Firebase
import FBSDKLoginKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureFirebase()
        
        FBSDKCoreKit.ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
        
        FirestoreManager.shared.start()
        
        return true
    }
    
    private func configureFirebase() {
        FirebaseApp.configure()
    }
}

