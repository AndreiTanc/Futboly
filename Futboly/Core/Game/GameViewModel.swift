//
//  GameViewModel.swift
//  Futboly
//
//  Created by Andrei Tanc on 24.11.2023.
//

import Foundation

class GameViewModel: ObservableObject {
    
    func cancelLobby() {
        Router.shared.popViewController()
    }
}
