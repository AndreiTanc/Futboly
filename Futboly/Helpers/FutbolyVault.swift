//
//  FutbolyVault.swift
//  Futboly
//
//  Created by Andrei Tanc on 25.08.2023.
//

import Foundation

enum StorageKeys: String {
    case isFirstRun
}

@objc public class FutbolyVault: NSObject {
    @objc public static var shared: FutbolyVault = {
        let vault = FutbolyVault()
        return vault
    }()

    @UserDefault<Bool>(key: StorageKeys.isFirstRun.rawValue)
    var isFirstRun: Bool?
}
