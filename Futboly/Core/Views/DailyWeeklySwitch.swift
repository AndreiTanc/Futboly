//
//  DailyWeeklySwitch.swift
//  Futboly
//
//  Created by Andrei Tanc on 30.11.2023.
//

import SwiftUI

struct DailyWeeklySwitch: View {
    @Binding var selectedGameType: GameType
    
    var body: some View {
        HStack {
            SwitchOption(selectedGameType: $selectedGameType, optionGameType: .daily)
            SwitchOption(selectedGameType: $selectedGameType, optionGameType: .weekly)
        }
        .frame(maxWidth: .infinity)
        .padding(8)
        .frame(height: 60)
        .background(Color.lightGray)
        .clipShape(.capsule)
    }
}

private struct SwitchOption: View {
    @Binding var selectedGameType: GameType
    var optionGameType: GameType
    
    var body: some View {
        Text(optionGameType.title)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(selectedGameType == optionGameType ? .white : .clear)
            .opacity(selectedGameType == optionGameType ? 1 : 0.6)
            .clipShape(.capsule)
            .shadow(color: .gray.opacity(selectedGameType == optionGameType ? 0.4 : 0), radius: 2, x: 1, y: 5)
            .onTapGesture {
                withAnimation {
                    selectedGameType = optionGameType
                }
            }
    }
}

#Preview {
    DailyWeeklySwitch(selectedGameType: .constant(.daily))
}
