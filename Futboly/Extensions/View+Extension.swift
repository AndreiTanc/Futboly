//
//  View+Extension.swift
//  Futboly
//
//  Created by Andrei Tanc on 28.08.2023.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
