//
//  HomeView.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.10.2023.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    var body: some View {
        VStack(spacing: 20) {
            ProfileHeaderView()
            Spacer()
        }.padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
