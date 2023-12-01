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
    // Onboarding
    case register
    case intro
    case howToPlay
    case tutorial
    case forgotPassword
    
    // Core
    case main
    case profile(User)
    case profileEdit
    case friends
    case newFriends
    case friendRequests
    
    // Game
    case lobby(GameViewModel)
    
    var view: any View {
        switch self {
        case .register:
            return RegisterView()
        case .intro:
            return IntroView()
        case .howToPlay:
            return HowToPlayIntroductoryView()
        case .tutorial:
            return TutorialView()
        case .forgotPassword:
            return ForgotPasswordView()
        case .profile(let user):
            return ProfileView(viewModel: ProfileViewModel(user: user))
        case .profileEdit:
            return ProfileEditView()
        case .main:
            return MainTabView()
        case .friends:
            return FriendsView(viewModel: FriendsViewModel(friendsScreenType: .existing))
        case .newFriends:
            return FriendsView(viewModel: FriendsViewModel(friendsScreenType: .new))
        case .friendRequests:
            return FriendsView(viewModel: FriendsViewModel(friendsScreenType: .friendRequest))
        case .lobby(let viewModel):
            return LobbyView(viewModel: viewModel)
        }
    }
}

final class Router {
    private var navigationController = UINavigationController()
    static var shared = Router()
    private init() {}
    
    var topViewController: UIViewController? {
        navigationController.topViewController
    }
    
    func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func popViewController(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }
    
    func goToScreen(withRoute route: RouterRoutes) {
        pushViewController(instantiateScreen(withRoute: route))
    }
    
    func reloadFlowFromRegister() {
        let registerVC = instantiateScreen(withRoute: .register)
        navigationController.setViewControllers([registerVC], animated: true)
    }
    
    func instantiateFirstScreen() -> UIViewController {
        var firstScreen: UIViewController
        
        if FutbolyVault.shared.isFirstRun ?? true {
            firstScreen = instantiateScreen(withRoute: .intro)
            FutbolyVault.shared.isFirstRun = false
        } else {
            if AuthManager.shared.isUserAuthenticated {
                firstScreen = instantiateScreen(withRoute: .main)
            } else {
                firstScreen = instantiateScreen(withRoute: .register)
            }
        }
        
        navigationController = .init(rootViewController: firstScreen)
        navigationController.navigationBar.isHidden = true
        navigationController.setNavigationBarHidden(true, animated: false)
        
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
