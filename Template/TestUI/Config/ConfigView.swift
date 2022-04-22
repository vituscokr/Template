//
//  ConfigView.swift
//  Template
//
//  Created by vitus on 2022/04/22.
//

import SwiftUI

struct ConfigView: View {
    
    @StateObject var model = ConfigModel()
    var body: some View {
        VStack {
            ForEach(model.items) { item in
                Text(item.key ?? "" )
                Text(item.value ?? "" )
            }
        }
        .onAppear(perform: load)
    }
    
    func load() {
        
    }
}

struct ConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
