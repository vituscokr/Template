//
//  TextModifer.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/14.
//

import Foundation
import SwiftUI

enum TextStyleType: CaseIterable {
    case bold16
    case bold14
    case bold24
    case bold26
}

public struct TextStyle: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    let forgroundColor: Color
    init(type: TextStyleType) {
        switch type {
        case .bold14:
            self.size = 14
            self.weight = .bold
            self.forgroundColor = Color.graydark3
        case .bold16:
            self.size = 16
            self.weight = .bold
            self.forgroundColor = Color.graydark3
        case .bold24:
            self.size = 24
            self.weight = .bold
            self.forgroundColor = Color.graydark3
        case .bold26:
            self.size = 26
            self.weight = .bold
            self.forgroundColor = Color.graydark3
        }
    }
    public init(size: CGFloat, weight: Font.Weight, forgroundColor: Color) {
        self.size = size
        self.weight = weight
        self.forgroundColor = forgroundColor
    }
    public func body(content: Content) -> some View {
        content
            .font(.system(size: self.size, weight: self.weight, design: .default))
            .foregroundColor(self.forgroundColor)
    }
}
