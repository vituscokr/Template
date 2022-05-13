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
    case testKey
    
    
    static func keyFromString (key : String ) -> ConfigKey?  {
        guard let ConfigKey  = ConfigKey.allCases.filter({ $0.rawValue == key  }).first else {
            return nil
        }
        return ConfigKey
    }
}




