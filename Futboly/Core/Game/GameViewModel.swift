//
//  GameViewModel.swift
//  Futboly
//
//  Created by Andrei Tanc on 24.11.2023.
//

import Foundation

class GameViewModel: ObservableObject {
    var gameType: GameType
    var lobby: Lobby?
    var ownGame: Bool = false
    
    @Published var shouldShowPlayersNotFound = false
    
    init(gameType: GameType) {
        self.gameType = gameType
    }
    
    func searchLobby(completion: @escaping (Bool) -> Void) {
        FirestoreManager.shared.searchLobby(forGame: gameType) { [weak self] lobby in
            if let lobby {
                // If lobby available => Joining it
                self?.joinLobby(lobby, completion: completion)
                return
            }
            
            // If no lobby existing => create your lobby
            self?.createLobby(completion: completion)
        }
    }
    
    func joinLobby(_ lobby: Lobby, completion: @escaping (Bool) -> Void) {
        FirestoreManager.shared.joinLobby(lobby) { [weak self] lobby in
            if let lobby {
                // JOIN this lobby
                self?.lobby = lobby
                self?.ownGame = false
                completion(true)
                return
            }
            
            // If somehow the lobby is no more => create your lobby
            self?.createLobby(completion: completion)
        }
    }
    
    func createLobby(completion: @escaping (Bool) -> Void) {
        FirestoreManager.shared.createNewLobby(forGame: gameType) { [weak self] lobby in
            // Users lobby => if he exists => delete lobby
            guard let lobby = lobby else { completion(false); return }
            
            self?.lobby = lobby
            self?.ownGame = true
            completion(true)
        }
    }
    
    func exitLobby() {
        guard let lobby else { Router.shared.popViewController(); return }
        
        if ownGame {
            // Delete lobby if own game
            FirestoreManager.shared.deleteLobby(lobby) {
                Router.shared.popViewController()
            }
        } else {
            // Just exit if not own game
            FirestoreManager.shared.exitLobby(lobby) {
                Router.shared.popViewController()
            }
        }
    }
    
    func tryAgain() {
        shouldShowPlayersNotFound = false
    }
}
