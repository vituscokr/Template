//
//  DetailInfoTitleStyle.swift
//  Test
//
//  Created by Gyeongtae Nam on 2022/09/19.
//

import Foundation
import SwiftUI
public struct DetailInfoTitleStyle: ViewModifier {
    public func body(content: Content) -> some View {
            content
                .lineLimit(2)
                .font(.title2)
                .foregroundColor(Color.red)
    }
}
extension Text {
    func detailInfoTitle() -> some View {
        modifier(DetailInfoTitleStyle())
    }
}
