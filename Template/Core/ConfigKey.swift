//
//  ConfigKey.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/13.
//

import Foundation

enum ConfigKey : String , CaseIterable {
    case fcmToken
    case accessToken
    case refreshToken
    case tokenExpire
    case refreshTokenExpire
    case deviceId
    
    
//    var val :String =  {
//
//        switch(self) {
//        case .fcmToken:
//            return
//
//        }
//
//    }
    
    //TEST
    case testKey
    
    
    static func keyFromString (key : String ) -> ConfigKey?  {
        for config in ConfigKey.allCases {
            if config.rawValue == key {
                return config
            }
        }
        return nil
    }
}




