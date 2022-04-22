//
//  SampleCoreConfig.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/13.
//

import SwiftUI

import LSSLibrary

struct SampleConfigView: View {
    @ObservedResults(RConfig.self) var configs
    var body: some View {

        VStack {
            ForEach(configs) { config in

                Text("\(config.key)")
                Text("\(config.value)")
                
                Button("delete") {
                    guard let key = ConfigKey.keyFromString(key: config.key) else {
                        return
                    }
                    
                    Config.shared.del(key)
                }
                .buttonStyle(PrimaryButton())
            }
            
            Button("CoreConfig Save Key : testKey value : test  ") {
                Config.shared.save(key: .testKey, value: "test")
            }
            .buttonStyle(PrimaryButton())
        }

    }
}

struct SampleCoreConfigView_Previews: PreviewProvider {
    static var previews: some View {
        SampleConfigView()
    }
}
