//
//  ProfileNavHeaderView.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.10.2023.
//

import SwiftUI

struct ProfileNavHeaderView: View {
    var title: String
    var backAction: () -> Void = {
        Router.shared.popViewController()
    }
    
    var body: some View {
        HStack {
            FutbolyBackButton(action: backAction)
            
            Text(title)
                .font(.system(size: 28, weight: .semibold))
            Spacer()
        }
    }
}

#Preview {
    ProfileNavHeaderView(title: "Profile")
}
