//
//  TestLottieView.swift
//  Template
//
//  Created by vitus on 2022/04/22.
//

import SwiftUI
import LSSLibrary

struct TestLottieView: View {
    var body: some View {
        LottieView(filename: "spinner")
    }
}

struct TestLottieView_Previews: PreviewProvider {
    static var previews: some View {
        TestLottieView()
    }
}
