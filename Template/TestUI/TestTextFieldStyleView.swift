//
//  TestTextFieldStyleView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/09/20.
//

import SwiftUI
import Introspect
struct TestTextFieldStyleView: View {
    @State var fieldState: FieldState = .normal
    @State var text: String = ""

    var body: some View {
        VStack {
            TextField("", text: $text)
                .textFieldStyle(LineStandardStyle(state: $fieldState,
                                                  text: $text,
                                                  placeholder: "입력폼"))
            Button {
                fieldState = .disable
            } label: {
                Text("disable")
            }
        }
    }
}

struct TestTextFieldStyleView_Previews: PreviewProvider {
    static var previews: some View {
        TestTextFieldStyleView()
    }
}
