//
//  ConfigView.swift
//  Template
//
//  Created by vitus on 2022/04/22.
//

import SwiftUI
import LSSLibrary
import CoreDataConfig
import Combine
struct ConfigView: View {
    @StateObject var model: ConfigModel = ConfigModel()
    var body: some View {
        VStack {
            ForEach(model.items) { item in
                Text(item.wrappedKey)
                Text(item.wrappedValue )
            }
            Button {
                ConfigStorage.shared.add(key: .userId, value: "B")
            } label: {
                Text("Add")
            }
            Button {
                ConfigStorage.shared.delete(key: .userId)
            } label: {
                Text("Delete")
            }
            Button {
                ConfigStorage.shared.upate(key: .userId, value: "C")
            } label: {
                Text("Update")
            }
            Button {
                let value = ConfigStorage.shared.read(key: .userId)
                Debug.log(value)
            } label: {
                Text("Read")
            }
        }
        .onAppear(perform: load)
    }
    func load() {
        // for item in model.items {
        //     Debug.log(item)
        //     Debug.log(item.wrappedKey)
        //     Debug.log(item.wrappedValue)
        // }
    }
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
