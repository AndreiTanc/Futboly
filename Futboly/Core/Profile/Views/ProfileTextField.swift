//
//  ProfileTextField.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.10.2023.
//

import SwiftUI

struct ProfileTextField: View {
    var title: String
    @Binding var text: String
    
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(.system(size: 14)).foregroundStyle(.gray)
                TextField("Please enter your \(title.lowercased())...", text: $text)
                    .autocorrectionDisabled()
            }
        }.padding(10)
        .background(Color.lightGray)
        .clipShape(.rect(cornerRadius: 15))
        .keyboardType(keyboardType)
        .submitLabel(.done)
    }
}

#Preview {
    ProfileTextField(title: "Team Name", text: .constant(""))
}
