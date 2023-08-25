//
//  Router.swift
//  Futboly
//
//  Created by Andrei Tanc on 08.07.2023.
//

import Foundation
import UIKit
import SwiftUI

enum RouterRoutes {
    case login
    case signup
    case tutorial
    
    var view: any View {
        switch self {
        case .login:
            return LoginView()
        case .signup:
            return SignupView()
        case .tutorial:
            return TutorialView()
        }
    }
}

final class Router {
    private var navigationController = UINavigationController()
    static var shared = Router()
    private init() {}
    
    func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func popViewController(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    func goToScreen(withRoute route: RouterRoutes) {
        pushViewController(instantiateScreen(withRoute: route))
    }
    
    func instantiateFirstScreen() -> UIViewController {
        var firstScreen: UIViewController
        
        if FutbolyVault.shared.isFirstRun ?? true {
            firstScreen = instantiateScreen(withRoute: .tutorial)
            FutbolyVault.shared.isFirstRun = false
        } else {
            firstScreen = instantiateScreen(withRoute: .login)
        }
        
        navigationController = .init(rootViewController: firstScreen)
        return navigationController
    }
    
    private func instantiateScreen(withRoute route: RouterRoutes) -> UIViewController {
        UIHostingController(
            rootView: AnyView(
                route.view
            )
        )
    }
}
