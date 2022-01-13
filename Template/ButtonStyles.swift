//
//  ButtonStyles.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/13.
//

import Foundation
import SwiftUI

struct PrimaryButton : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        PrimaryButtonView(configuration: configuration)
    }
}
private extension PrimaryButton {
    struct PrimaryButtonView: View {
        @Environment(\.isEnabled) var isEnabled
        let configuration: PrimaryButton.Configuration
        
        var body :some View {
            return configuration.label
                .font(.system(size: 16, weight: .regular, design: .default))
                .padding()
                .background(
                    Capsule()
                        .fill(isEnabled ? Color.mainpink : Color.mainpink_light)
                )
                .foregroundColor(Color.white)
                .opacity(configuration.isPressed ? 0.8 : 1.0)
            
        }
    }
}


struct SecnondaryButton : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        SecnondaryButtonView(configuration: configuration)
    }
}
private extension SecnondaryButton {
    struct SecnondaryButtonView: View {
        @Environment(\.isEnabled) var isEnabled
        let configuration: PrimaryButton.Configuration
        
        var body :some View {
            return configuration.label
                .font(.system(size: 16, weight: .regular, design: .default))
                .padding()
                .background(
                    Capsule()
                        .stroke(isEnabled ? Color.mainpink : Color.mainpink_light)
                )
                .foregroundColor(isEnabled ? Color.mainpink : Color.mainpink_light)
                .opacity(configuration.isPressed ? 0.8 : 1.0)
            
        }
    }
}


struct DarkButton : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        DarkButtonView(configuration: configuration)
    }
}
private extension DarkButton {
    struct DarkButtonView: View {
        @Environment(\.isEnabled) var isEnabled
        let configuration: PrimaryButton.Configuration
        
        var body :some View {
            return configuration.label
                .font(.system(size: 16, weight: .regular, design: .default))
                .padding()
                .background(
                    Capsule()
                        .fill(isEnabled ? Color.darkgray2 : Color.graylight1)
                )
                .foregroundColor(Color.white)
                .opacity(configuration.isPressed ? 0.8 : 1.0)
            
        }
    }
}
