//
//  ProfileViewModel.swift
//  Futboly
//
//  Created by Andrei Tanc on 21.11.2023.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func playMatch() {
        
    }
}
