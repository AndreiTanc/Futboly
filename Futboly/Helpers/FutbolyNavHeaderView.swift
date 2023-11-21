//
//  FutbolyNavHeaderView.swift
//  Futboly
//
//  Created by Andrei Tanc on 21.11.2023.
//

import SwiftUI

struct FutbolyNavHeaderView: View {
    var title: String
    var buttonTitle: String = ""
    var buttonAction: () -> Void = {}
    
    var body: some View {
        HStack(spacing: 15) {
            FutbolyBackButton { Router.shared.popViewController() }
            Text(title).font(.system(size: 26, weight: .semibold))
            Spacer()
            if !buttonTitle.isEmpty {
                Button(buttonTitle, action: buttonAction).foregroundStyle(.black)
            }
        }.padding(.horizontal)
    }
}

#Preview {
    FutbolyNavHeaderView(title: "Header")
}
