//
//  AppendRightButton.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/09/20.
//
import SwiftUI
public struct AppendRightButton: ViewModifier {
    var action: () -> Void
    public func body(content: Content) -> some View {
        HStack(spacing: 0) {
            content
            Button(action: action) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24, alignment: .center)
            }
        }
    }
}
