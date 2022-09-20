//
//  Extensions+TextField.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/09/01.
//
// https://www.raywenderlich.com/34699757-swiftui-view-modifiers-tutorial-for-ios
import Foundation
import SwiftUI
class EmailValidator: ObservableObject {
    let emailPattern = #"^\S+@\S+\.\S+$"#
    @Published var email = ""
    func isValid(_ email: String) -> Bool {
        email.range(of: emailPattern, options: .regularExpression) != nil
    }
}
struct Validate: ViewModifier {
    var value: String
    var validator: (String) -> Bool
    func body(content: Content) -> some View {
        content
            .border(validator(value) ? .green: .red)
    }
}
extension TextField {
    func validateEmail( value: String,
                        validator: @escaping (String) -> (Bool)
    ) -> some View {
        modifier(Validate(value: value, validator: validator))
    }
}
