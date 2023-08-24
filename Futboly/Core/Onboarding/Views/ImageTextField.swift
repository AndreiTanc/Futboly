//
//  ImageTextField.swift
//  Futboly
//
//  Created by Andrei Tanc on 22.08.2023.
//

import SwiftUI

struct ImageTextField: View {
    var type: TextFieldType
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(type.imageName)
            TextField(type.placeholder, text: $text)
        }
        .padding()
        .background(Color.white)
        .frame(height: 50)
        .cornerRadius(25)
    }
}

struct ImageTextField_Previews: PreviewProvider {
    static var previews: some View {
        ImageTextField(type: .password, text: .constant(""))
    }
}

extension ImageTextField {
    enum TextFieldType {
        case email
        case password
        case confirmPassword
        case teamName
        
        var placeholder: String {
            switch self {
            case .email:
                return "Email"
            case .password:
                return "Password"
            case .confirmPassword:
                return "Confirm password"
            case .teamName:
                return "Team name"
            }
        }
        
        var imageName: String {
            switch self {
            case .email:
                return ImageName.email.rawValue
            case .password, .confirmPassword:
                return ImageName.password.rawValue
            case .teamName:
                return ImageName.profile.rawValue
            }
        }
    }
}
