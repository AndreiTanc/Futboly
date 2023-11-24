//
//  FutbolySearchBar.swift
//  Futboly
//
//  Created by Andrei Tanc on 24.11.2023.
//

import SwiftUI

struct FutbolySearchBar: View {
    @Binding var text: String
    var searchButtonTapped: () -> Void = {}
    
    var body: some View {
        HStack {
            TextField("Please enter Team Name", text: $text)
            Button("Search", action: searchButtonTapped)
            if !text.isEmpty {
                Button("Clear", action: clearButtonTapped)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .padding(.horizontal)
        .background(.white)
        .clipShape(.capsule)
    }
    
    private func clearButtonTapped() {
        text = ""
        searchButtonTapped()
    }
}

#Preview {
    FutbolySearchBar(text: .constant(""))
}
