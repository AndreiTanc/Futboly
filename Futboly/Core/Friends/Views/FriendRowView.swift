//
//  FriendRowView.swift
//  Futboly
//
//  Created by Andrei Tanc on 31.10.2023.
//

import SwiftUI
import Kingfisher

struct FriendRowView: View {
    var friend: User
    var friendType: FriendsScreenType
    
    @State var isButtonEnabled = true
    var buttonAction: () -> Void = {}
    
    var body: some View {
        HStack {
            FutbolyAsyncImage(imageUrlString: friend.profileImageURL)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(friend.teamName).fontWeight(.semibold)
                HStack(spacing: 0) {
                    Image(.upBlackArrow)
                    Text("\(friend.bestScore)")
                        .padding(.trailing, 10)
                    
                    Image(.achievments)
                    Text("\(friend.numberOfWins)")
                        .padding(.trailing, 10)
                }.opacity(0.7)
            }
            
            Spacer()
            buttonView
        }
    }
    
    var buttonView: some View {
        Button {
            buttonAction()
            if friendType == .new { isButtonEnabled = false }
        } label: {
            Text(buttonTitle())
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .font(.system(size: 16))
        }
        .disabled(!isButtonEnabled)
        .padding()
        .padding(.horizontal, 5)
        .frame(height: 40)
        .background(Color.black)
        .clipShape(Capsule())
        .opacity(isButtonEnabled ? 1 : 0.4)
    }
    
    func buttonTitle() -> String {
        var title = friendType.buttonTitle
        if friendType == .new && !isButtonEnabled { title = "Sent" }
        return title
    }
}

#Preview {
    FriendRowView(friend: User(fromDict: [:]), friendType: .existing)
}
