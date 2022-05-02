//
//  TemplateApp.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/13.
//

import SwiftUI
import LSSLibrary

@main
struct TemplateApp: App {
    let persistenceController = PersistenceController.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            
            TestMyFileView()
            
//            LaunchView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//                .onChange(of: scenePhase) { phase in
//                    switch(phase) {
//                    case .active:
//                        Debug.log("active")
//                    case .inactive:
//                        Debug.log("inactive")
//                    case .background:
//                        Debug.log("background")
//                        appDelegate.scheduleBackground()
//                    @unknown default:
//                        Debug.log("unknown")
//
//                    }
//                }

        }
    }
}
