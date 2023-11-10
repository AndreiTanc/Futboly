//
//  SocialLoginView.swift
//  Futboly
//
//  Created by Andrei Tanc on 23.08.2023.
//

import SwiftUI

struct SocialLoginView: View {
    var facebookAction: () -> Void
    var googleAction: () -> Void
    var appleAction: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 20) {
                Rectangle().frame(height: 2).foregroundColor(.lightGray)
                Text("or connect with").layoutPriority(1).foregroundColor(.gray)
                Rectangle().frame(height: 2).foregroundColor(.lightGray)
            }
            
            HStack(spacing: 35) {
                SocialLoginButton(imageName: ImageName.facebookLogo.rawValue, action: facebookAction)
                SocialLoginButton(imageName: ImageName.googleLogo.rawValue, action: googleAction)
                SocialLoginButton(imageName: ImageName.appleLogo.rawValue, action: appleAction)
            }
        }
    }
}

struct SocialLoginView_Previews: PreviewProvider {
    static var previews: some View {
        SocialLoginView(facebookAction: {}, googleAction: {}, appleAction: {})
    }
}
