//
//  AppDelegate.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/14.
//

import Foundation
import SwiftUI
import LSSLibrary


class AppDelegate : NSObject, UIApplicationDelegate, ObservableObject, UNUserNotificationCenterDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        saveDeviceId()
        
        setupBackgroundRegister()
        
//TODO: Firebase
//        FirebaseApp.configure()
//        setupNotification(application)
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return .portrait
    }
    
}


import BackgroundTasks
extension AppDelegate {
    func saveDeviceId() {
//        let deviceId = Config.shared.read(.deviceId)
//        guard deviceId == "" else { return }
//        guard let deviceId = UIDevice.current.identifierForVendor?.uuidString else { return }
//        Config.shared.save(key: .deviceId, value: deviceId)
    }
}


//ios 13 이전에 적용되는 방식
//https://blog.naver.com/PostView.nhn?blogId=horajjan&logNo=220577912369
//Signing & Capabilities > Background Modes enable
// Background Modes > Backgroudnd fetch check

//Info.plist Permitted background task scheduler identifiers
//백그라운드 패치를 초기화함
//가장 짧은 주기롱 옵션 설정

//import BackgroundTasks
//https://medium.com/hcleedev/swift-swiftui-프로젝트에-appdelegate-scenedelegate-만들기-4fa2d85191e


//https://developer.apple.com/videos/play/wwdc2019/707/
//https://developer.apple.com/videos/play/wwdc2019/707
//https://www.andyibanez.com/posts/modern-background-tasks-ios13/
//https://pokeapi.co
//지금 이방법은 ios 13 이하에서 사용
//        UIApplication.shared.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)

//        BGTaskScheduler
//            BGTask
//                BGAppRefreshTask
//                BGProcessingTask
//                    BGAppRefreshTaskRequest
//                    BGProcessingTaskReques
/// 백그라운드 관련 extension
/// https://lemon-dev.tistory.com/entry/iOS-BackgroundTask-Framework-간단-정리
extension AppDelegate  {

    func setupBackgroundRegister() {
        BGTaskScheduler.shared.register(forTaskWithIdentifier: AppConstant.backgroundFetchIdentifier, using: nil) { task in
            self.handleAppRefreshTask(task: task as! BGAppRefreshTask)
        }
        
        BGTaskScheduler.shared.register(forTaskWithIdentifier: AppConstant.backgroundProcessIdentifier, using: nil) { task in
            self.handleAppProcessingTask(task: task as! BGProcessingTask)
        }
    }
    
    
    func scheduleBackground() {
        scheduleBackgroundFetchTask()
        scheduleBackgroundProcessingTask()
        
        //해당 라인 위에 브레이크를 걸어주세요.
        //이후 break 걸고
        //콘솔에서 명령어 입력
        //e -l objc -- (void)[[BGTaskScheduler sharedScheduler] _simulateLaunchForTaskWithIdentifier:@"kr.dobuled.Test.fetch"]
        
       // e -l objc -- (void)[[BGTaskScheduler sharedScheduler] _simulateLaunchForTaskWithIdentifier:@"kr.dobuled.Test.process"]
        
    }
    
    func scheduleBackgroundFetchTask() {
        
        Debug.log(#function)
        
        
        let request = BGAppRefreshTaskRequest(identifier: AppConstant.backgroundFetchIdentifier)
        request.earliestBeginDate = Date(timeIntervalSinceNow: 1 * 60)
        do {
            try BGTaskScheduler.shared.submit(request)
        }catch {
            print("Unable to submit task: \(error.localizedDescription)")
        }
    }
    
    func scheduleBackgroundProcessingTask() {
        
        Debug.log(#function)
        
        
        let request = BGProcessingTaskRequest(identifier: AppConstant.backgroundProcessIdentifier)
        //네트워크 사용여부, 에너지 소모량 옵션도 있습니다.
        request.requiresNetworkConnectivity = false
        request.requiresExternalPower = true
        
        do {
            try BGTaskScheduler.shared.submit(request)
        }catch {
            print("Unable to submit task: \(error.localizedDescription)")
        }
        
    }
    

    func handleAppRefreshTask(task: BGAppRefreshTask) {
        
        Debug.log(#function)
        
        task.expirationHandler = {
            
            Debug.log("expirationHandler")
        }
        
        Debug.log("hi")
        
        var success : Bool = true
        
        task.setTaskCompleted(success: success)
    }
    
    func handleAppProcessingTask(task: BGProcessingTask) {
        
        Debug.log(#function)
        
        task.expirationHandler =  {
            Debug.log("expirationHander")
        }
        
        Debug.log("hi")
        
        var success : Bool = true
        success = false
        
        task.setTaskCompleted(success: success)
    }
}
