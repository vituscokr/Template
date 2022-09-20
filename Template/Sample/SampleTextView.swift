//
//  SampleTextView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/14.
//

import SwiftUI

struct SampleTextView: View {
    var body: some View {
        VStack {
            ForEach(TextStyleType.allCases, id: \.self) { type in
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .modifier(TextStyle(type: type))
            }
        }
    }
}

struct SampleTextView_Previews: PreviewProvider {
    static var previews: some View {
        SampleTextView()
    }
}
