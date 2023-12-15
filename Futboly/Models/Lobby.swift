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
    
    init(id: String, teamName: String, profileImageURL: String) {
        self.id = id
        self.teamName = teamName
        self.profileImageURL = profileImageURL
    }
    
    init(fromDict dict: [String: Any]) {
        self.id = dict["id"] as? String ?? ""
        self.teamName = dict["teamName"] as? String ?? ""
        self.profileImageURL = dict["profileImageURL"] as? String ?? ""
    }
    
    func toDict() -> [String: Any] {
        [
            "id": id,
            "teamName": teamName,
            "profileImageURL": profileImageURL
        ]
    }
}

struct Lobby: Codable {
    var id: String
    var gameType: String
    var players: [LobbyUser] = []
    
    init(id: String, gameType: String, players: [LobbyUser]) {
        self.id = id
        self.gameType = gameType
        self.players = players
    }
    
    init(fromDict dict: [String: Any]) {
        id = dict["id"] as? String ?? ""
        gameType = dict["gameType"] as? String ?? ""
        if let playerDicts = dict["players"] as? [[String: Any]] {
            players = playerDicts.map({ LobbyUser(fromDict: $0) })
        }
    }
}
