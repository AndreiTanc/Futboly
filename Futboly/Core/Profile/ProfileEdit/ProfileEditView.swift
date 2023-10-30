//
//  ProfileEditView.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.10.2023.
//

import SwiftUI
import PhotosUI

struct ProfileEditView: View {
    @ObservedObject private(set) var viewModel: ProfileEditViewModel = ProfileEditViewModel()
    
    var body: some View {
        ZStack {
            Color.lightGray.ignoresSafeArea()
            content
        }.onTapGesture { hideKeyboard() }
    }
    
    var content: some View {
        VStack(spacing: 15) {
            ProfileNavHeaderView(title: "Profile Edit").padding(.bottom, 30)
            profilePhotoEditView
            formView
            saveButton
            Spacer()
        }.padding(.horizontal)
    }
    
    var profilePhotoEditView: some View {
        HStack(spacing: 15) {
            Image(.defaultProfile)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
            
            PhotosPicker(selection: $viewModel.imageSelection, matching: .images) {
                Text("Change Photo").foregroundStyle(.black).fontWeight(.semibold)
            }.padding().background(Color.lightGray).clipShape(.capsule)
            
            Spacer(minLength: 0)
            
            Button {
                // remove
            } label: {
                Text("Remove").foregroundStyle(.red).fontWeight(.semibold)
            }
        }.padding().background(.white).clipShape(.rect(cornerRadius: 24))
    }
    
    var formView: some View {
        VStack(alignment: .leading) {
            Text("Team Info")
            ProfileTextField(title: "Team Name", text: $viewModel.teamName)
            
            Text("Contacts")
            ProfileTextField(title: "Phone Number", text: $viewModel.phoneNumber, keyboardType: .phonePad)
        }.padding().background(.white).clipShape(.rect(cornerRadius: 24))
    }
    
    var saveButton: some View {
        Button {
            viewModel.save()
        } label: {
            Text("Save").frame(maxWidth: .infinity)
        }.buttonStyle(RoundedBlackButton())
    }
}

#Preview {
    ProfileEditView()
}
