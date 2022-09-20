//
//  LaunchModel.swift
//  Template
//
//  Created by vitus on 2022/04/22.
//

import SwiftUI
import LSSLibrary

class LaunchModel: ObservableObject {
    @Published var isNetwork: Bool = false
    // 앱형태를 선택 합니다.
    var environment: AppEnvironment  = .develop
    public init() {
      //  NetworkMonitor.start()
        //
       // NetworkMonitor.start()
    }
}
