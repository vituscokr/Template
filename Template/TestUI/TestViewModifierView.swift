//
//  TestViewModifierView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/09/20.
//

import SwiftUI
import LSSLibrary
struct TestViewModifierView: View {
    @StateObject var model: EmailValidator = EmailValidator()
    var body: some View {
        VStack(spacing: 0) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .detailInfoTitle()
            Button {
            } label: {
                Text("click me")
            }
            .buttonStyle(PrimaryButtonStyle())
            TextField("이메일", text: $model.email)
                .validateEmail(value: model.email) { email in
                    Debug.log(email)
                    Debug.log(model.isValid(email))
                    return model.isValid(email)
                }
            Text("hi")
                .prefixWithSFSymbol(named: "airpods.gen3")
        }
    }
}

struct TestViewModifierView_Previews: PreviewProvider {
    static var previews: some View {
        TestViewModifierView()
    }
}
