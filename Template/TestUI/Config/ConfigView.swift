//
//  ConfigView.swift
//  Template
//
//  Created by vitus on 2022/04/22.
//

import SwiftUI
import LSSLibrary

struct ConfigView: View {
    
    @StateObject var model = ConfigModel()
    var body: some View {
        VStack {
            ForEach(model.items) { item in
                Text(item.wrappedKey)
                Text(item.wrappedValue )
            }
            
            Button {
                ConfigStorage.shared.add(key: "A", value: "B")
            } label: {
                Text("Add")
            }
            
            
            Button {
                ConfigStorage.shared.delete(key: "A")
            } label: {
                Text("Delete")
            }
            
            
            Button {
                ConfigStorage.shared.upate(key: "A", value: "C")
            } label: {
                Text("Update")
            }
            
            Button {
                let value = ConfigStorage.shared.read(key: "A")
                Debug.log(value)
                
                
            } label: {
                Text("Read")
            }
            
            

        }
        .onAppear(perform: load)
    }
    
    func load() {
        
        for item in model.items {
            
            Debug.log(item)
            
            Debug.log(item.wrappedKey)
            Debug.log(item.wrappedValue)
        }
    }
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
