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
    var hostPlayerId: String
    var creationDate: TimeInterval
    var gameType: String
    var players: [LobbyUser] = []
    
    init(id: String, hostPlayerId: String, creationDate: TimeInterval, gameType: String, players: [LobbyUser]) {
        self.id = id
        self.hostPlayerId = hostPlayerId
        self.creationDate = creationDate
        self.gameType = gameType
        self.players = players
    }
    
    init(fromDict dict: [String: Any]) {
        id = dict["id"] as? String ?? ""
        hostPlayerId = dict["hostPlayerId"] as? String ?? ""
        creationDate = dict["creationDate"] as? TimeInterval ?? Date().timeIntervalSince1970
        gameType = dict["gameType"] as? String ?? ""
        if let playerDicts = dict["players"] as? [[String: Any]] {
            players = playerDicts.map({ LobbyUser(fromDict: $0) })
        }
    }
    
    func remainingSeconds() -> Int {
        let lobbyCreationDate = Date(timeIntervalSince1970: creationDate)
        let remainaingSeconds = Date().timeIntervalSince(lobbyCreationDate)
        
        return Int(remainaingSeconds)
    }
}
