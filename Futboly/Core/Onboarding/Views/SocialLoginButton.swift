//
//  SocialLoginButton.swift
//  Futboly
//
//  Created by Andrei Tanc on 23.08.2023.
//

import SwiftUI

struct SocialLoginButton: View {
    var imageName: String
    var completion: () -> Void
    
    var body: some View {
        Button {
            completion()
        } label: {
            Image(imageName)
        }
    }
}

struct SocialLoginButton_Previews: PreviewProvider {
    static var previews: some View {
        SocialLoginButton(imageName: ImageName.facebookLogo.rawValue, completion: {})
    }
}
