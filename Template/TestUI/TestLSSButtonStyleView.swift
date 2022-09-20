//
//  TestLSSButtonStyleView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/04/29.
//

import SwiftUI
import LSSLibrary

struct TestLSSButtonStyleView: View {
    var body: some View {
        Button {
            Debug.log("hi")
        } label: {
            EmptyView()
        }
        .buttonStyle(LSSButtonStyle(change: { state in
            Text("hi")
                .foregroundColor(state ? Color.red: Color.blue)
        }))
    }
}

struct TestLSSButtonStyleView_Previews: PreviewProvider {
    static var previews: some View {
        TestLSSButtonStyleView()
    }
}
