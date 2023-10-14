//
//  FutbolyAlert.swift
//  Futboly
//
//  Created by Andrei Tanc on 14.10.2023.
//

import SwiftUI

struct FutbolyAlert: View {
    var title: String?
    var description: String
    var buttonTitle: String
    
    var action: () -> Void = {}
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            if let title {
                Text(title)
            } else {
                Image("futboly")
            }
            
            Text(description).multilineTextAlignment(.center).font(.system(size: 15)).padding(.bottom, 5)
            
            Button(buttonTitle) {
                action()
            }.buttonStyle(RoundedBlackButton())
        }.padding(30)
        .padding(.top, 5)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 30))
        .padding()
    }
}

#Preview {
    FutbolyAlert(description: "Futboly is an exciting mobile app that allows you to put your football knowledge to the test by playing against other users. Here's a concise tutorial on how to play:", buttonTitle: "Continue")
}
