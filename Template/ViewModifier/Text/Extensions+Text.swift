//
//  Extensions+Text.swift
//  Test
//
//  Created by Gyeongtae Nam on 2022/09/19.
//

import Foundation
import SwiftUI
extension Text {
    func prefixWithSFSymbol(named name: String) -> some View {
        HStack(spacing: 0) {
            Image(systemName: name)
                .resizable()
                .scaledToFill()
                .frame(width: 17, height: 17, alignment: .center)
            self
        }
        .padding(.leading, 12)
    }
}
