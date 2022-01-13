//
//  SampleBadgesView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/13.
//

import SwiftUI




struct SampleBadgeView: View {
    var body: some View {
        VStack {
            ForEach(BadgesType.allCases , id: \.self ) { type in
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .modifier(Badge(type) )
            }
        }

    }
}

struct SampleBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        SampleBadgeView()
    }
}
