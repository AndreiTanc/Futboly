//
//  PublicFriendMatchesSwitch.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.11.2023.
//

import SwiftUI

struct PublicFriendMatchesSwitch: View {
    @Binding var selectedOpponentType: OpponentType
    var body: some View {
        HStack {
            SwitchOption(selectedOpponenetType: $selectedOpponentType, optionOpponentType: .public)
            Spacer(minLength: 0)
            SwitchOption(selectedOpponenetType: $selectedOpponentType, optionOpponentType: .friends)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .padding(.horizontal, 8)
    }
}

private struct SwitchOption: View {
    @Binding var selectedOpponenetType: OpponentType
    var optionOpponentType: OpponentType
    
    var body: some View {
        Text(optionOpponentType.title + " Matches")
            .font(.system(size: 22, weight: .semibold))
            .opacity(selectedOpponenetType == optionOpponentType ? 1 : 0.6)
            .onTapGesture {
                withAnimation {
                    selectedOpponenetType = optionOpponentType
                }
            }
    }
}

#Preview {
    PublicFriendMatchesSwitch(selectedOpponentType: .constant(.public))
}
