//
//  PrimaryButtonStyle.swift
//  Test
//
//  Created by Gyeongtae Nam on 2022/09/19.
//

import Foundation
import SwiftUI
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title3)
            .padding(.horizontal, 30)
            .padding(.vertical, 8)
            .foregroundColor(
                configuration.isPressed
                ? Color.mint.opacity(0.2)
                : Color.pink)
            .overlay( RoundedRectangle(cornerRadius: 8)
                .stroke( configuration.isPressed
                         ? Color.mint.opacity(0.2)
                         : Color.pink,
                         lineWidth: 1.5)
            )
    }
}
