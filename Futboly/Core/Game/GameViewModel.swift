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
    
    func searchLobby() {
        FirestoreManager.shared.searchLobby(forGame: gameType) { [weak self] lobby in
            if let lobby {
                // If lobby available => Joining it
                self?.joinLobby(lobby)
                return
            }
            
            // If no lobby existing => create your lobby
            self?.createLobby()
        }
    }
    
    func joinLobby(_ lobby: Lobby) {
        FirestoreManager.shared.joinLobby(lobby) { [weak self] lobby in
            if let lobby {
                // JOIN this lobby
                self?.lobby = lobby
                self?.ownGame = false
                return
            }
            
            // If somehow the lobby is no more => create your lobby
            self?.createLobby()
        }
    }
    
    func createLobby() {
        FirestoreManager.shared.createNewLobby(forGame: gameType) { [weak self] lobby in
            // Users lobby => if he exists => delete lobby
            self?.lobby = lobby
            self?.ownGame = true
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
