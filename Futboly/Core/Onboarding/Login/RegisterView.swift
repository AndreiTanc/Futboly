//
//  RegisterView.swift
//  Futboly
//
//  Created by Andrei Tanc on 08.07.2023.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject private(set) var viewModel = RegisterViewModel()
    @FocusState private var focusedField: OnboardingTextField.TextFieldType?
    
    @Namespace private var namespace2
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 30) {
                Spacer()
                headerView
                Spacer()
                
                onboardingTypeSwitcher.frame(maxWidth: .infinity)
                formView
                signButton
                Spacer()
                
                SocialLoginView()
            }.padding(.horizontal).padding(.bottom)
        }
    }
    
    var headerView: some View {
        VStack {
            Image(ImageName.futboly.rawValue).padding(.top)
            Text("YOUR TEAM. YOUR WAY.").font(.system(size: 17)).fontWeight(.light)
        }
    }
    
    var onboardingTypeSwitcher: some View {
        HStack {
            Button("Sign in") {
                withAnimation(.spring()) {
                    viewModel.currentOnboardingType = .signIn
                }
            }.buttonStyle(OnboardingSelectedTypeButton(isSelected: viewModel.currentOnboardingType == .signIn))
                
            
            Button("Sign up") {
                withAnimation(.spring()) {
                    viewModel.currentOnboardingType = .signUp
                }
            }.buttonStyle(OnboardingSelectedTypeButton(isSelected: viewModel.currentOnboardingType == .signUp))
                
        }.padding(10)
        .background(Color.lightGray)
        .clipShape(.rect(cornerRadius: 15))
        .matchedGeometryEffect(id: "oneId", in: namespace2)
    }
    
    var formView: some View {
        VStack {
            OnboardingTextField(type: .email, text: $viewModel.email, focusedField: $focusedField)
            OnboardingTextField(
                type: .password, text: $viewModel.password,
                focusedField: $focusedField,
                submitLabel: viewModel.currentOnboardingType == .signIn ? .done : .next
            )
            if viewModel.currentOnboardingType == .signUp {
                OnboardingTextField(type: .teamName, text: $viewModel.teamName, focusedField: $focusedField, submitLabel: .done)
            }
        }
        .onSubmit {
            switch focusedField {
            case .email:
                focusedField = .password
            case .password:
                if viewModel.currentOnboardingType == .signUp { focusedField = .teamName }
            default:
                break
            }
        }
    }
    
    var signButton: some View {
        Button {
            viewModel.register()
        } label: {
            Text(viewModel.currentOnboardingType.description).frame(maxWidth: .infinity)
        }.buttonStyle(RoundedBlackButton())
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
