//
//  FutbolyBackButton.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.10.2023.
//

import SwiftUI

struct FutbolyBackButton: View {
    var action: () -> Void = {}
    
    var body: some View {
        Image(.leftBlackSign)
            .padding()
            .background(.white)
            .clipShape(.circle)
            .onTapGesture { action() }
    }
}

#Preview {
    FutbolyBackButton()
}
