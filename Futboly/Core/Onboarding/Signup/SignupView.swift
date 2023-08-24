//
//  SignupView.swift
//  Futboly
//
//  Created by Andrei Tanc on 23.08.2023.
//

import SwiftUI

struct SignupView: View {
    @ObservedObject private(set) var viewModel = SignupViewModel()
    
    var body: some View {
        ZStack {
            FutbolyGreenBackground()
            content
        }
    }
    
    var content: some View {
        VStack(spacing: 15) {
            Text("FUTBOLY").font(.system(size: 30)).fontWeight(.bold).foregroundColor(.white).padding(.top, 20)
            Text("YOUR TEAM. YOUR WAY.").font(.system(size: 14)).fontWeight(.light).foregroundColor(.white)
            Spacer()
            
            signupForm
            Spacer()
            
            SocialLoginView()
            
            Button {
                viewModel.goBackToLogin()
            } label: {
                Text("Already have an account? Login here!").foregroundColor(.white)
            }.padding(.top, 15)
            Spacer()
            
            Text("By clicking Sign Up, Connect with Facebook, Connect with Google, Connect with Apple you agree with our [Terms and Conditions](https://www.apple.com/) and [Privacy Statement](https://www.apple.com/)")
                .foregroundColor(.white).fontWeight(.light).font(.system(size: 15)).multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            
        }.padding(.horizontal)
    }
    
    var signupForm: some View {
        VStack(spacing: 20) {
            ImageTextField(type: .email, text: $viewModel.email)
            ImageTextField(type: .password, text: $viewModel.password)
            ImageTextField(type: .confirmPassword, text: $viewModel.confirmedPassword)
            ImageTextField(type: .teamName, text: $viewModel.teamName)
            
            Button {
                viewModel.signup()
            } label: {
                Text("Sign Up").frame(maxWidth: .infinity)
            }.buttonStyle(RoundedBlueButton())
            
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
