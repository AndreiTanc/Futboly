//
//  ProfileView.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.10.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.lightGray.ignoresSafeArea()
            Image(.noiseBackground)
                .resizable()
                .ignoresSafeArea()
            content
        }
    }
    
    var content: some View {
        VStack(spacing: 20) {
            ProfileHeaderView()
            profileInformationView
            logoutButton
            Spacer()
        }.padding(.horizontal)
    }
    
    var profileInformationView: some View {
        HStack {
            Image(.defaultProfile)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Team name")
                    .font(.system(size: 24))
                Text("256 matches were played")
                    .font(.system(size: 14))
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Button {
                Router.shared.goToScreen(withRoute: .profileEdit)
            } label: {
                Image(.edit)
            }.padding(.trailing)
        }.padding()
        .background(.white)
        .clipShape(.rect(cornerRadius: 32))
    }
    
    var logoutButton: some View {
        Button {
            // logout
        } label: {
            Text("Logout")
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    ProfileView()
}
