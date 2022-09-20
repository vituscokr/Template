//
//  TextFieldStyle.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/09/20.
//
// swiftlint:disable identifier_name 

import Foundation
import SwiftUI
import Introspect

enum FieldState {
    // 평상시
    case normal
    // focused 된 상태
    case active
    // 글자 입력 상태
    case input
    // 에러 상태
    case error
    // 사용불가
    case disable
}

struct LineStandardStyle: TextFieldStyle {
    @Binding var state: FieldState
    @Binding var text: String
    var placeholder: String
    @State var textField: UITextField?
    let placeholderColor: Color = .green
    let accentColor: Color = .red
    let textColor: Color = .blue
    var showClear: Bool {
        switch state {
        case .disable, .normal, .active, .error:
                return false
        case .input:
                return true
        }
    }
    var showPlaceholder: Bool {
        if !placeholder.isEmpty && text.isEmpty && state == .normal {
            return true
        } else {
            return false
        }
    }
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            VStack(spacing: 0) {
                if state == .disable {
                    configuration
                        .disabled(true)
                } else {
                    configuration
                        .accentColor(accentColor)
                        .foregroundColor(textColor)
                        .onChange(of: text) { _ in
                            state =  text.isEmpty ? .active : .input
                        }
                        .padding(.trailing, 40)
                        .introspectTextField(customize: { textfield in
                            self.textField = textfield
                        })
                }
                Color.gray
                    .frame(maxWidth: .infinity, maxHeight: 1)
            }
            .opacity(state == .disable ? 0.5 : 1)
            if showPlaceholder {
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text(placeholder)
                            .foregroundColor(placeholderColor)
                        Spacer()
                    }
                }
            } else if showClear {
                HStack(spacing: 0) {
                    Spacer()
                    Button {
                        text = ""
                    }  label: {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                    }
                    .frame(width: 40, height: 40, alignment: .trailing)
                }
            }
        }
        .frame(height: 44)
        .onTapGesture {
            guard state != .disable else { return }
            state = .active
            textField?.becomeFirstResponder()
        }
    }
}
