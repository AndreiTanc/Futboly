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
        .sheet(isPresented: $viewModel.shouldPresentCountryPicker) {
            CountryPicker(
                shouldPresentCountryPicker: $viewModel.shouldPresentCountryPicker,
                selectedCountry: $viewModel.country
            ).presentationDetents([.medium])
        }
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
            Image(uiImage: viewModel.selectedImage ?? UIImage(named: "default_profile_image") ?? UIImage())
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(.rect(cornerRadius: 25))
                .aspectRatio(contentMode: .fill)
            
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
            countryPickerView
            
            Text("Contacts")
            ProfileTextField(title: "Phone Number", text: $viewModel.phoneNumber, keyboardType: .phonePad)
        }.padding().background(.white).clipShape(.rect(cornerRadius: 24))
    }
    
    var countryPickerView: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text("Country").font(.system(size: 14)).foregroundStyle(.gray)
                Text(viewModel.country.isEmpty ? "Please select a country" : viewModel.country)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .opacity(viewModel.country.isEmpty ? 0.3 : 1)
            }
        }.padding(10)
        .background(Color.lightGray)
        .clipShape(.rect(cornerRadius: 15))
        .onTapGesture {
            viewModel.shouldPresentCountryPicker = true
        }
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
