//
//  TestPreferenceView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/09/01.
//

import SwiftUI
///https://velog.io/@kipsong/SwiftUI-Preference-Key-coordinatespace
struct TestPreferenceView: View {
    
    let messages: [String]
    
    var body: some View {
        NavigationView {
            List(messages, id: \.self)  { message in
                Text(message)
            }
            .navigationBarTitle("Messages")
        }
        .onPreferenceChange(NavigationBarTitleKey.self) { title in
            print(title) 
        }
    }
}
//key - value 로 구성된 데이터 전달 수단입니다.
//전달 방향은 하위뷰 -> 상위뷰 입니다.
struct NavigationBarTitleKey : PreferenceKey {
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

extension View {
    func navigationBarTtile(_ title: String) -> some View {
        self.preference(key: NavigationBarTitleKey.self, value: title )
    }
}

struct TestPreferenceView_Previews: PreviewProvider {
    static var previews: some View {
        TestPreferenceView(messages: ["a","b","c"])
    }
}
