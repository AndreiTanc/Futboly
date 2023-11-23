//
//  CountryPicker.swift
//  Futboly
//
//  Created by Andrei Tanc on 23.11.2023.
//

import SwiftUI

struct CountryPicker: View {
    @Binding var shouldPresentCountryPicker: Bool
    @Binding var selectedCountry: String
    
    var body: some View {
        NavigationView {
            Picker("Pick your country", selection: $selectedCountry) {
                ForEach(CountryManager.shared.countries, id: \.self) { i in
                    Text("\(i)").font(.system(size: 20, weight: .semibold))
                }
            }
            .pickerStyle(.wheel)
            .navigationTitle("Pick your country")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done", action: onDismiss)
                }
            }
        }
    }
    
    private func onDismiss() {
        shouldPresentCountryPicker = false
    }
}

#Preview {
    CountryPicker(shouldPresentCountryPicker: .constant(true), selectedCountry: .constant(""))
}
