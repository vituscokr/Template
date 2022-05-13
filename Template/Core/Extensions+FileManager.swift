//
//  Extensions+FileManager.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/05/10.
//

import Foundation
import Combine

extension FileManager {
    static func sharedContainerURL() -> URL {
        return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.vitus.Test")!
        
    }
}
