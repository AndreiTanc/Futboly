//
//  FriendRowView.swift
//  Futboly
//
//  Created by Andrei Tanc on 31.10.2023.
//

import SwiftUI

struct FriendRowView: View {
    var matchAction: () -> Void = {}
    
    var body: some View {
        HStack {
            Image(.defaultProfile)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(.rect(cornerRadius: 18))
                .padding(.trailing, 5)
            
            VStack(alignment: .leading, spacing: 3) {
                Text("Team Name").fontWeight(.semibold)
                HStack(spacing: 0) {
                    Image(.upBlackArrow)
                    Text("40.5")
                        .padding(.trailing, 10)
                    
                    Image(.achievments)
                    Text("122")
                        .padding(.trailing, 10)
                }.opacity(0.7)
            }
            
            Spacer()
            matchButton
        }
    }
    
    var matchButton: some View {
        Button {
            matchAction()
        } label: {
            Text("Match")
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .font(.system(size: 16))
        }.padding()
        .padding(.horizontal, 5)
        .frame(height: 40)
        .background(Color.black)
        .clipShape(Capsule())
    }
}

#Preview {
    FriendRowView()
}
