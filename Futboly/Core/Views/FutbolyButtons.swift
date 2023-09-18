//
//  FutbolyButtons.swift
//  Futboly
//
//  Created by Andrei Tanc on 23.08.2023.
//

import SwiftUI

struct RoundedBlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(height: 50)
            .background(Color.futbolyBlue)
            .foregroundStyle(.white)
            .fontWeight(.bold)
            .font(.system(size: 20))
            .clipShape(Capsule())
    }
}

struct RoundedDarkBlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(height: 50)
            .background(Color.futbolyDarkBlue)
            .foregroundStyle(.white)
            .fontWeight(.bold)
            .font(.system(size: 20))
            .clipShape(Capsule())
    }
}

struct RoundedBlackButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(height: 50)
            .padding(.horizontal)
            .background(Color.black)
            .foregroundStyle(.white)
            .fontWeight(.bold)
            .font(.system(size: 16))
            .clipShape(Capsule())
    }
}

struct RoundedWhiteButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(height: 50)
            .padding(.horizontal)
            .background(Color.white)
            .foregroundStyle(.black)
            .fontWeight(.bold)
            .font(.system(size: 16))
            .clipShape(Capsule())
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
    }
}
