//
//  OnboardingTextField.swift
//  Futboly
//
//  Created by Andrei Tanc on 19.09.2023.
//

import SwiftUI

struct OnboardingTextField: View {
    var type: TextFieldType
    @Binding var text: String
    
    var focusedField: FocusState<TextFieldType?>.Binding
    var submitLabel: SubmitLabel = .next
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(type.name).font(.system(size: 14)).foregroundStyle(.gray)
                if type == .password {
                    SecureField("Please enter your \(type.name.lowercased())...", text: $text)
                        .autocorrectionDisabled()
                } else {
                    TextField("Please enter your \(type.name.lowercased())...", text: $text)
                        .autocorrectionDisabled()
                }
            }
            
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(ImageName.close.rawValue)
                }
            }
            
        }.padding(10)
        .background(Color.lightGray)
        .clipShape(.rect(cornerRadius: 15))
        .focused(focusedField, equals: type)
        .textContentType(type.textContentType)
        .keyboardType(type.keyboardType)
        .submitLabel(submitLabel)
    }
}

extension OnboardingTextField {
    enum TextFieldType: Hashable {
        case email
        case password
        case teamName
        
        var name: String {
            switch self {
            case .email:
                return "Email"
            case .password:
                return "Password"
            case .teamName:
                return "Team name"
            }
        }
        
        var imageName: String {
            switch self {
            case .email:
                return ImageName.email.rawValue
            case .password:
                return ImageName.password.rawValue
            case .teamName:
                return ImageName.profile.rawValue
            }
        }
        
        var textContentType: UITextContentType {
            switch self {
            case .email:
                return .emailAddress
            case .password:
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
