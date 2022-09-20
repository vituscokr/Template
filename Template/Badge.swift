//
//  Badges.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/13.
//

import Foundation
import SwiftUI

enum BadgesType :CaseIterable{
    case pink
    case purple
    case green
    case yellow
    case gray
    
}
struct Badge : ViewModifier {
    var titleColor : Color
    var backgroundColor : Color
    init(_ type: BadgesType) {
        switch(type) {
        case .pink:
            titleColor = Color.mainPinkDark
            backgroundColor = Color.pinklight2
        case .purple:
            titleColor = Color.purple
            backgroundColor = Color.purpleLight
            
        case .green:
            titleColor = Color.green
            backgroundColor = Color.greenLight
        case .yellow:
            titleColor = Color.yellowdark
            backgroundColor = Color.yellowlight
        case .gray:
            titleColor = Color.graydark1
            backgroundColor = Color.graylight1
        }
    }
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12))
            .font(.system(size: 12, weight: .medium, design: .default))
            .foregroundColor(titleColor )
            .background(
                Capsule()
                    .fill(backgroundColor)
            )
    }
}
