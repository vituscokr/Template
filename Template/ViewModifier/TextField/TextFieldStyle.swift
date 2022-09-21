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

struct InputColors {
    var placeholderColor: Color
    var accentColor: Color
    var textColor: Color
    var backgroundColor: Color
    var textErrorColor: Color
    var lineActiveColor: Color
    var lineNormalCaolor: Color
    var lineErrorColor: Color
    var lineDisableColor: Color
}
struct LineStandardStyle: TextFieldStyle {
    @Binding var state: FieldState
    @Binding var text: String
    var placeholder: String
    @State var textField: UITextField?
    var colors: InputColors
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
    func lineSection(state: FieldState) -> some View {
        ZStack {
            if state == .disable || state == .normal {
                colors.lineNormalCaolor
            } else if state == .active || state == .input {
                colors.lineActiveColor
            } else if state == .error {
                colors.lineErrorColor
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 1)
    }
    func clearSection() -> some View {
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
    func placeholderSection() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(placeholder)
                    .foregroundColor(colors.placeholderColor)
                Spacer()
            }
        }
    }
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            colors.backgroundColor
            VStack(spacing: 0) {
                if state == .disable {
                    configuration
                        .disabled(true)
                        .frame(height: 43)
                } else {
                    configuration
                        .accentColor(colors.accentColor)
                        .foregroundColor(colors.textColor)
                        .onChange(of: text) { _ in
                            state =  text.isEmpty ? .active : .input
                        }
                        .padding(.trailing, 40)
                        .introspectTextField(customize: { textfield in
                            self.textField = textfield
                        })
                        .frame(height: 43)
                }
                lineSection(state: state)
            }
            .opacity(state == .disable ? 0.5 : 1)
            .frame(height: 44)
            if showPlaceholder {
                placeholderSection()
            } else if showClear {
                clearSection()
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
