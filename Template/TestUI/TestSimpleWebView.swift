//
//  TestSimpleWebView.swift
//  Template
//
//  Created by vitus on 2022/04/22.
//

import SwiftUI
import LSSLibrary

struct TestSimpleWebView: View {
    @State var request: URLRequest?  = URLRequest(url: URL(string: "http://naver.com")!)
    var body: some View {
        SimpleWebView(_request)
    }
}

struct TestSimpleWebView_Previews: PreviewProvider {
    static var previews: some View {
        TestSimpleWebView()
    }
}
