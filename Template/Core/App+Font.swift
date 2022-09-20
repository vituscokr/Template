//
//  App+Font.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/05/03.
//

import Foundation
import SwiftUI

enum AppFont {
    case bold18
    case regular18
    var font: UIFont {
        switch self {
        case .bold18: return UIFont.systemFont(ofSize: 18, weight: .bold)
        case .regular18: return  UIFont.systemFont(ofSize: 18, weight: .regular)

        }
    }
    var lineHeight: CGFloat {
        switch self {
        case .bold18: return 28
        case .regular18: return 28
        }
    }

    var kerning: CGFloat {
        return -0.6
    }
}

extension Text {
    func applyFont(font: AppFont, underlined: Bool = false ) -> some View {
        if underlined {
            return self
                .font(Font(font.font))
                .underline()
                .kerning(font.kerning)
                .lineSpacing(font.lineHeight - font.font.lineHeight)
                .padding(.vertical, (font.lineHeight - font.font.lineHeight) / 2 )
       } else {
            return self
                .font(Font(font.font))
                .kerning(font.kerning)
                .lineSpacing(font.lineHeight - font.font.lineHeight)
                .padding(.vertical, (font.lineHeight - font.font.lineHeight) / 2 )
        }
    }
}
