//
//  SceneDelegate.swift
//  Futboly
//
//  Created by Andrei Tanc on 07.07.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        
        window?.windowScene = windowScene
        window?.rootViewController = Router.shared.instantiateFirstScreen()
        window?.makeKeyAndVisible()
    }
}

