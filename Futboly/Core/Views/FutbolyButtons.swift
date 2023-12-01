//
//  FutbolyButtons.swift
//  Futboly
//
//  Created by Andrei Tanc on 23.08.2023.
//

import SwiftUI

struct RoundedBlackButton: ButtonStyle {
    var height: CGFloat = 50
    var regularPadding: CGFloat = 15
    var horizontalPadding: CGFloat = 15
    var fontSize: CGFloat = 16
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(regularPadding)
            .frame(height: height)
            .padding(.horizontal, horizontalPadding)
            .background(Color.black)
            .foregroundStyle(.white)
            .fontWeight(.bold)
            .font(.system(size: fontSize))
            .clipShape(Capsule())
    }
}

struct RoundedWhiteButton: ButtonStyle {
    var height: CGFloat = 50
    var regularPadding: CGFloat = 15
    var horizontalPadding: CGFloat = 15
    var fontSize: CGFloat = 16
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(regularPadding)
            .frame(height: height)
            .padding(.horizontal, horizontalPadding)
            .background(Color.white)
            .foregroundStyle(.black)
            .fontWeight(.bold)
            .font(.system(size: fontSize))
            .clipShape(Capsule())
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
    }
}

struct OnboardingSelectedTypeButton: ButtonStyle {
    var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(13)
            .foregroundStyle(isSelected ? Color.black : .gray)
            .font(.system(size: 18, weight: .semibold))
            .frame(maxWidth: .infinity)
            .background(isSelected ? Color.white : .clear)
            .clipShape(.rect(cornerRadius: 15))
            .shadow(color: .gray.opacity(isSelected ? 0.4 : 0), radius: 2, x: 1, y: 5)
    }
}

struct OnboardingUnselectedTypeButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(Color.gray)
            .font(.system(size: 18, weight: .semibold))
            .frame(maxWidth: .infinity)
    }
}

struct TutorialStepButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 56, height: 56)
            .background(Color.futbolyPink)
            .clipShape(.circle)
    }
}

struct PinkRoundedButton: ButtonStyle {
    var height: CGFloat = 44
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .fontWeight(.semibold)
            .frame(height: 44)
            .padding(.horizontal, 20)
            .background(Color.futbolyPink)
            .clipShape(.capsule)
    }
}

struct GrayRoundedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 50).frame(maxWidth: .infinity)
            .background(Color.lightGray).clipShape(.capsule)
            .foregroundStyle(Color.black)
            .fontWeight(.semibold)
    }
}
