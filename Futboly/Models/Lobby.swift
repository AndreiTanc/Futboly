//
//  Lobby.swift
//  Futboly
//
//  Created by Andrei Tanc on 24.11.2023.
//

import Foundation

struct LobbyUser: Codable {
    var id: String
    var teamName: String
    var profileImageURL: String
}

struct Lobby: Codable {
    var id: String
    var gameType: String
    var players: [LobbyUser]
    
    init(id: String, gameType: String, players: [LobbyUser]) {
        self.id = id
        self.gameType = gameType
        self.players = players
    }
    
    init(fromDict dict: [String: Any]) {
        id = dict["id"] as? String ?? ""
        gameType = dict["gameType"] as? String ?? ""
        players = dict["players"] as? [LobbyUser] ?? []
    }
}
