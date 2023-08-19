//
//  LoginView.swift
//  Futboly
//
//  Created by Andrei Tanc on 08.07.2023.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private(set) var viewModel = LoginViewModel()
    
    var body: some View {
        Text("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
