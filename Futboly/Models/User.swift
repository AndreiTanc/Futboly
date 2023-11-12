//
//  User.swift
//  Futboly
//
//  Created by Andrei Tanc on 10.11.2023.
//

import Foundation

class User: Codable {
    var id: String
    var email: String
    var teamName: String
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
        profileImageURL = dict["profileImageURL"] as? String ?? ""
    }
    
}
