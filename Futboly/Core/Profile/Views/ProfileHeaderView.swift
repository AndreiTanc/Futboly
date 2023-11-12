//
//  ProfileHeaderView.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.10.2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(FutbolyVault.shared.user.teamName)
                    .font(.system(size: 28, weight: .semibold))
                
                HStack(spacing: 0) {
                    Image(.upBlackArrow)
                    Text("40.5").fontWeight(.semibold)
                        .padding(.trailing, 10)
                    
                    Image(.achievments)
                    Text("122").fontWeight(.semibold)
                        .padding(.trailing, 10)
                    
                    Image(.thunder)
                    Text("12").fontWeight(.semibold).foregroundStyle(Color.futbolyPink)
                }.padding(.leading, 6)
            }
            
            Spacer()
            Image(uiImage: FutbolyVault.shared.userProfileImage)
                .resizable()
                .frame(width: 48, height: 48)
                .clipShape(.rect(cornerRadius: 20))
                .aspectRatio(contentMode: .fill)
        }
    }
}

#Preview {
    ProfileHeaderView()
}
