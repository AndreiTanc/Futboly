//
//  FriendRequest.swift
//  Futboly
//
//  Created by Andrei Tanc on 13.11.2023.
//

import Foundation

enum FriendRequestStatus: String {
    case requested
    case declined
    case accepted
}

struct FriendRequest: Codable, Identifiable {
    var id: String = UUID().uuidString
    
    // User information
    var teamName: String
    var profileImageURL: String
    var numberOfWins: Int
    var bestScore: Int
    
    // Request information
    var status: String
    var date: String
    
    // Users Ids
    var fromUser: String
    var toUser: String
    
    init(for user: User) {
        teamName = user.teamName
        profileImageURL = user.profileImageURL
        numberOfWins = user.numberOfWins
        bestScore = user.bestScore
        
        status = FriendRequestStatus.requested.rawValue
        date = Date().timeStampString()
        
        fromUser = FutbolyVault.shared.user.id
        toUser = user.id
    }
    
    init(fromDict dict: [String: Any]) {
        teamName = dict["teamName"] as? String ?? ""
        profileImageURL = dict["profileImageURL"] as? String ?? ""
        numberOfWins = dict["numberOfWins"] as? Int ?? 0
        bestScore = dict["bestScore"] as? Int ?? 0
        status = dict["status"] as? String ?? ""
        date = dict["date"] as? String ?? ""
        fromUser = dict["fromUser"] as? String ?? ""
        toUser = dict["toUser"] as? String ?? ""
    }
}

extension Date {
    func timeStampString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        return dateFormatter.string(from: self)
    }
}

extension String {
    func dateFromString() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        return dateFormatter.date(from: self)
    }
}
