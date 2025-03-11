//
//  Game.swift
//  Futboly
//
//  Created by Andrei Tanc on 18.12.2023.
//

import Foundation

enum PlayerType {
    case striker
    case defender
    case captain
    case midfielder
    case goalkeeper
}

struct Player: Codable {
    
}

struct GameUser: Codable {
    // User Info
    var id: String
    var teamName: String
    var profileImageURL: String
    
    // Game
    var pickingOrder: Int = 0
    
    var striker: Player?
    var defender: Player?
    var captain: Player?
    var midfielder: Player?
    var goalkeeper: Player?
    
    init(fromLobbyUser lobbyUser: LobbyUser) {
        id = lobbyUser.id
        teamName = lobbyUser.teamName
        profileImageURL = lobbyUser.profileImageURL
    }
}

struct Game: Codable {
    var id: String
    var hostPlayerId: String
    var creationDate: TimeInterval
    var gameType: String
    var players: [GameUser] = []
    
    init(fromLobby lobby: Lobby) {
        id = lobby.id
        hostPlayerId = lobby.hostPlayerId
        creationDate = lobby.creationDate
        gameType = lobby.gameType
        players = lobby.players.map({ GameUser(fromLobbyUser: $0) })
    }
}
