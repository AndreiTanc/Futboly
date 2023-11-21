//
//  FriendRequestRowView.swift
//  Futboly
//
//  Created by Andrei Tanc on 17.11.2023.
//

import SwiftUI
import Kingfisher

struct FriendRequestRowView: View {
    @State var friendRequest: FriendRequest
    
    var acceptAction: (FriendRequest) -> Void
    var declineAction: (FriendRequest) -> Void
    
    var body: some View {
        HStack {
            FutbolyAsyncImage(imageUrlString: friendRequest.profileImageURL)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(friendRequest.teamName).fontWeight(.semibold)
                HStack(spacing: 0) {
                    Image(.upBlackArrow)
                    Text("\(friendRequest.bestScore)")
                        .padding(.trailing, 10)
                    
                    Image(.achievments)
                    Text("\(friendRequest.numberOfWins)")
                        .padding(.trailing, 10)
                }.opacity(0.7)
            }
            
            Spacer()
            
            if friendRequest.status == FriendRequestStatus.requested.rawValue {
                buttonsView
            } else {
                statusView
            }
        }
    }
    
    var buttonsView: some View {
        HStack {
            Button("Accept") {
                acceptAction(friendRequest)
                withAnimation {
                    friendRequest.status = FriendRequestStatus.accepted.rawValue
                }
            }.buttonStyle(RoundedBlackButton(height: 40, regularPadding: 4, horizontalPadding: 5, fontSize: 12))
            
            Button("Decline") {
                declineAction(friendRequest)
                withAnimation {
                    friendRequest.status = FriendRequestStatus.declined.rawValue
                }
            }.buttonStyle(RoundedWhiteButton(height: 40, regularPadding: 4, horizontalPadding: 5, fontSize: 12))
        }
    }
    
    var statusView: some View {
        Text(friendRequest.status)
            .font(.system(size: 12, weight: .bold))
            .padding(4)
            .frame(height: 40)
            .padding(.horizontal, 5)
            .background(Color.black)
            .clipShape(.capsule)
            .opacity(0.4)
    }
}

#Preview {
    FriendRequestRowView(friendRequest: .init(fromDict: [:]), acceptAction: {_ in }, declineAction: {_ in })
}
