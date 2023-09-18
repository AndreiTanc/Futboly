//
//  LoginView.swift
//  Futboly
//
//  Created by Andrei Tanc on 08.07.2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private(set) var viewModel = LoginViewModel()
    @FocusState private var focusedField: ImageTextField.TextFieldType?
    
    var body: some View {
        ZStack {
            FutbolyGreenBackground()
            content
        }.navigationBarHidden(true)
        .onTapGesture(perform: hideKeyboard)
    }
    
    var content: some View {
        VStack(spacing: 15) {
            Text("FUTBOLY").font(.system(size: 30)).fontWeight(.bold).foregroundColor(.white).padding(.top, 20)
            Text("YOUR TEAM. YOUR WAY.").font(.system(size: 14)).fontWeight(.light).foregroundColor(.white)
            Spacer()
            
            loginForm
            Spacer()
            
            SocialLoginView()
            
            Button {
                viewModel.goToSignup()
            } label: {
                Text("Don't have an account? Signup here!").foregroundColor(.white)
            }.padding(.top, 15)
            Spacer()
            
        }.padding(.horizontal)
    }
    
    var loginForm: some View {
        VStack(spacing: 20) {
            ImageTextField(type: .email, focusedField: $focusedField, text: $viewModel.email)
            ImageTextField(type: .password, focusedField: $focusedField, text: $viewModel.password, submitLabel: .done)
            
            Button {
                viewModel.login()
            } label: {
                Text("Login").frame(maxWidth: .infinity)
            }.buttonStyle(RoundedBlueButton())
            
            Button {
                viewModel.forgotPassword()
            } label: {
                Text("Forgot password?").foregroundColor(.white)
            }
        }
        .onSubmit {
            switch focusedField {
            case .email:
                focusedField = .password
            default:
                break
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
