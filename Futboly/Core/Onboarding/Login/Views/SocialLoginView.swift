//
//  SocialLoginView.swift
//  Futboly
//
//  Created by Andrei Tanc on 23.08.2023.
//

import SwiftUI

struct SocialLoginView: View {
    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 20) {
                Rectangle().frame(height: 2).foregroundColor(.white)
                Text("or connect with").layoutPriority(1).fontWeight(.semibold).foregroundColor(.white)
                Rectangle().frame(height: 2).foregroundColor(.white)
            }
            
            HStack(spacing: 35) {
                SocialLoginButton(imageName: ImageName.facebookLogo.rawValue) { }
                SocialLoginButton(imageName: ImageName.googleLogo.rawValue) { }
                SocialLoginButton(imageName: ImageName.appleLogo.rawValue) { }
            }
        }
    }
}

struct SocialLoginView_Previews: PreviewProvider {
    static var previews: some View {
        SocialLoginView()
    }
}
