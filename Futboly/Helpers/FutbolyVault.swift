//
//  FutbolyVault.swift
//  Futboly
//
//  Created by Andrei Tanc on 25.08.2023.
//

import Foundation
import UIKit
import FirebaseAuth

enum StorageKeys: String {
    case isFirstRun
}

public class FutbolyVault: ObservableObject {
    public static var shared: FutbolyVault = {
        let vault = FutbolyVault()
        return vault
    }()

    @UserDefault<Bool>(key: StorageKeys.isFirstRun.rawValue)
    var isFirstRun: Bool?
    
    var isUserLogged: Bool {
        Auth.auth().currentUser?.uid != nil
    }
    
    @Published var user: User
    @Published var userProfileImage: UIImage
    
    private init() {
        user = User(fromDict: [:])
        userProfileImage = UIImage(named: "default_profile_image") ?? UIImage()
    }
    
    func reset() {
        user = User(fromDict: [:])
        userProfileImage = UIImage(named: "default_profile_image") ?? UIImage()
    }
}
