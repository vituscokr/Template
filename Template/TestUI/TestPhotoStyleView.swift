//
//  TestPhotoStyleView.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/09/20.
//

import SwiftUI
import LSSLibrary
struct TestPhotoStyleView: View {
    var body: some View {
        // 375 393
        Image("sample")
            .photoStyle(withMaxWidth: 200, withMaxHeight: 200)
    }
}

struct TestPhotoStyleView_Previews: PreviewProvider {
    static var previews: some View {
        TestPhotoStyleView()
    }
}
