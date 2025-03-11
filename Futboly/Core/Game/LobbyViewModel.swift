//
//  LobbyViewModel.swift
//  Futboly
//
//  Created by Andrei Tanc on 19.12.2023.
//

import Foundation
import Combine
import ProgressHUD

class LobbyViewModel: ObservableObject {
    var gameType: GameType
    
    @Published var lobby: Lobby?
    @Published var shouldShowPlayersNotFound = false
    var cancellable: AnyCancellable?
    
    var numberOfPlayersNeeded: Int = 3
    @Published var remainingLobbyWaitingTime: Int = 45
    var lobbyWaitingTimer: Timer?
    
    var isHost: Bool {
        lobby?.hostPlayerId == FutbolyVault.shared.user.id
    }
    
    init(gameType: GameType) {
        self.gameType = gameType
    }
    
    deinit {
        disableListeners()
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
                self?.lobby = lobby
                self?.handleJoinedLobby()
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
            self?.handleJoinedLobby()
            completion(true)
        }
    }
    
    func exitLobby(withPop: Bool = true) {
        guard let lobby else {
            if withPop { Router.shared.popViewController() }
            return
        }
        FirestoreManager.shared.exitLobby(lobby) {
            if withPop {
                Router.shared.popViewController()
            }
        }
    }
    
    private func handleJoinedLobby() {
        addLobbyListener()
        if !isHost, let waitingTime = lobby?.remainingSeconds() {
            remainingLobbyWaitingTime -= waitingTime
        }
        lobbyWaitingTimer = Timer(timeInterval: 1, target: self, selector: #selector(onLobbyTimerUpdate), userInfo: nil, repeats: true)
        RunLoop.current.add(lobbyWaitingTimer!, forMode: .common)
    }
    
    private func addLobbyListener() {
        guard let lobby else { return }
        FirestoreManager.shared.listenToLobbyChanges(lobby)
        
        cancellable?.cancel()
        cancellable = FirestoreManager.shared.didChangeLobbyPublisher
            .sink(receiveValue: { [weak self] lobby in
                self?.onLobbyChange(lobby)
            })
    }
    
    private func onLobbyChange(_ lobby: Lobby?) {
        print("New lobby")
        self.lobby = lobby
        if let lobby {
            if lobby.players.count == 3 {
                print("New lobby - 3 players")
                disableListeners()
                lobbyWaitingTimer = nil
                Router.shared.goToScreen(withRoute: .pregame)
                // start game
                // disable listeners
                // disable timer
                // delete lobby
            }
        } else {
            print("New lobby = nil")
            self.exitLobby(withPop: false)
        }
    }
    
    @objc
    private func onLobbyTimerUpdate() {
        remainingLobbyWaitingTime -= 1
        if remainingLobbyWaitingTime == 0 {
            exitLobby(withPop: false)
            shouldShowPlayersNotFound = true
        }
    }
    
    func tryAgain() {
        ProgressHUD.animate()
        searchLobby { [weak self] successfulyJoinedLobby in
            ProgressHUD.dismiss()
            if successfulyJoinedLobby {
                self?.shouldShowPlayersNotFound = false
            } else {
                // present error at joining a lobby
            }
        }
    }
    
    private func disableListeners() {
        cancellable = nil
        FirestoreManager.shared.stopListeningToLobbyChanges()
    }
}

