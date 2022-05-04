//
//  LoginView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/05/04.
//

import SwiftUI

struct LoginView: View {
    
    @State var id :String = ""
    @State var pw : String = ""
    @State var isLogin :Bool = false
    var body: some View {

        VStack {
            
            TextField("", text: $id)
                .accessibilityIdentifier("id")
            TextField("", text: $pw)
                .accessibilityIdentifier("pw")
            
            Button(action: {
                
                isLogin = true
                
            }) {
                Text("로그인")
            }
            .id("login")
            .accessibilityIdentifier("login")
            Button("Ray") {
                
            }
                .id(1)
            
            if isLogin {
                Text("isLogin")
                    .accessibilityIdentifier("isLogin")
            }
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()

        }
    }
}
