//
//  AppDelegate.swift
//  Futboly
//
//  Created by Andrei Tanc on 07.07.2023.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureFirebase()
        
        // Override point for customization after application launch.
        return true
    }
    
    private func configureFirebase() {
        FirebaseApp.configure()
    }
}

