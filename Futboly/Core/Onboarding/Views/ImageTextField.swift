//
//  ImageTextField.swift
//  Futboly
//
//  Created by Andrei Tanc on 22.08.2023.
//

import SwiftUI

struct ImageTextField: View {
    var type: TextFieldType
    var focusedField: FocusState<TextFieldType?>.Binding
    @Binding var text: String
    var submitLabel: SubmitLabel = .next
    
    var body: some View {
        HStack(spacing: 15) {
            Image(type.imageName)
            TextField(type.placeholder, text: $text)
        }
        .focused(focusedField, equals: type)
        .textContentType(type.textContentType)
        .keyboardType(type.keyboardType)
        .submitLabel(submitLabel)
        .padding()
        .background(Color.white)
        .frame(height: 50)
        .cornerRadius(25)
    }
}

extension ImageTextField {
    enum TextFieldType: Hashable {
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
        
        var textContentType: UITextContentType {
            switch self {
            case .email:
                return .emailAddress
            case .password, .confirmPassword:
                return .password
            case .teamName:
                return .nickname
            }
        }
        
        var keyboardType: UIKeyboardType {
            switch self {
            case .email:
                return .emailAddress
            default:
                return .default
            }
        }
    }
}
