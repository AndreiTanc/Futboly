//
//  HomeView.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.10.2023.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    @ObservedObject private(set) var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            ProfileHeaderView()
            Button("Present alert") {
                viewModel.shouldPresentRewardAlert = true
            }
            Spacer()
        }
        .padding(.horizontal)
        .fullScreenCover(isPresented: $viewModel.shouldPresentRewardAlert) {
            RewardAlertView(dismissAction: {
                viewModel.shouldPresentRewardAlert = false
            }).background(ClearBackground())
        }
    }
}

#Preview {
    HomeView()
}
