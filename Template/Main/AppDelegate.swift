//
//  AppDelegate.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/14.
//

import Foundation
import SwiftUI


class AppDelegate : NSObject, UIApplicationDelegate, ObservableObject, UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        saveDeviceId()
//TODO: Firebase
//        FirebaseApp.configure()
//        setupNotification(application)
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return .portrait
    }
    
}

extension AppDelegate {
    func saveDeviceId() {
        let deviceId = Config.shared.read(.deviceId)
        guard deviceId == "" else { return }
        guard let deviceId = UIDevice.current.identifierForVendor?.uuidString else { return }
        Config.shared.save(key: .deviceId, value: deviceId)
    }
}
