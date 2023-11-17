//
//  FriendsScreenType.swift
//  Futboly
//
//  Created by Andrei Tanc on 13.11.2023.
//

import Foundation

enum FriendsScreenType {
    case existing
    case new
    case friendRequest
    
    var buttonTitle: String {
        switch self {
        case .existing: "Match"
        case .new: "Invite"
        case .friendRequest: "Accept"
        }
    }
    
    var headerTitle: String {
        switch self {
        case .existing: "My Friends"
        case .new: "Invite new Friends"
        case .friendRequest: "Friend Requests"
        }
    }
}
