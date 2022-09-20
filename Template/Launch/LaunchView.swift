//
//  LaunchView.swift
//  Template
//
//  Created by vitus on 2022/04/22.
//

import SwiftUI

struct LaunchView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @StateObject var networkMonitorModel  = NetworkMonitor() 
    
    @StateObject var launchModel : LaunchModel = LaunchModel()
    var body: some View {
        NavigationView {
            
            if networkMonitorModel.isConnected {
                
            
            MainView()
                .environment(\.managedObjectContext, viewContext)
            }else {
                Text("Connet Internet")
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
