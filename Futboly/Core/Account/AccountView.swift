//
//  AccountView.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.10.2023.
//

import SwiftUI
import FirebaseAuth

struct AccountView: View {
    @ObservedObject private(set) var vault: FutbolyVault = FutbolyVault.shared

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
            profileOptionsView
            logoutButton
            Spacer()
        }.padding(.horizontal)
    }
    
    var profileInformationView: some View {
        HStack {
            Image(uiImage: vault.userProfileImage)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(.rect(cornerRadius: 25))
                .aspectRatio(contentMode: .fill)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(vault.user.teamName)
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
    
    var profileOptionsView: some View {
        VStack(spacing: 20) {
            HStack {
                Image(.eyeProfile).padding().background(Color.lightGray).clipShape(.circle)
                VStack(alignment: .leading, spacing: 4) {
                    Text("My Friends")
                    Text("Challange your friends to a duel").font(.system(size: 15)).opacity(0.7)
                }
                Spacer()
                Image(.leftBlackSign).rotationEffect(.degrees(180))
            }.onTapGesture {
                Router.shared.goToScreen(withRoute: .friends)
            }
            
            HStack {
                Image(.eyeProfile).padding().background(Color.lightGray).clipShape(.circle)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Friend Requests")
                    Text("Get to know more people").font(.system(size: 15)).opacity(0.7)
                }
                Spacer()
                Image(.leftBlackSign).rotationEffect(.degrees(180))
            }.onTapGesture {
                Router.shared.goToScreen(withRoute: .friendRequests)
            }
            
        }.padding()
        .background(.white)
        .clipShape(.rect(cornerRadius: 32))
    }
    
    var logoutButton: some View {
        Button {
            do {
                try Auth.auth().signOut()
                FutbolyVault.shared.reset()
                Router.shared.reloadFlowFromRegister()
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
        } label: {
            Text("Logout")
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    AccountView()
}
