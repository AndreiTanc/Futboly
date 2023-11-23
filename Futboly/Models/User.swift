//
//  User.swift
//  Futboly
//
//  Created by Andrei Tanc on 10.11.2023.
//

import Foundation

class User: Codable, Identifiable {
    var id: String
    var email: String
    var teamName: String
    var country: String = ""
    var bestScore: Int = 0
    var numberOfWins: Int = 0
    var profileImageURL: String = ""
    
    init(id: String, email: String, teamName: String) {
        self.id = id
        self.email = email
        self.teamName = teamName
    }
    
    init(fromDict dict: [String: Any]) {
        id = dict["id"] as? String ?? ""
        email = dict["email"] as? String ?? ""
        teamName = dict["teamName"] as? String ?? ""
        country = dict["country"] as? String ?? ""
        bestScore = dict["bestScore"] as? Int ?? 0
        numberOfWins = dict["numberOfWins"] as? Int ?? 0
        profileImageURL = dict["profileImageURL"] as? String ?? ""
    }
}
