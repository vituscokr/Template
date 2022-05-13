//
//  App+URL.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/05/04.
//

import Foundation

enum AppURLs {
    
    static func cacheDirectory() -> URL {
        guard let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last else {
            fatalError("unable to get system cache directory - serious problem")
        }
        return URL(fileURLWithPath: cachePath)
    }
    
    static func documentDirectory() -> URL {
        guard let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last else {
            fatalError("unable to get system docs directory - serious problem")
        }
        return URL(fileURLWithPath: docPath)
    }
}
