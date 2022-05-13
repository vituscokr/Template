//
//  WidgetContent.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/05/09.
//

import Foundation
import SwiftUI
import WidgetKit

struct WidgetContent : Codable , TimelineEntry {
    var date = Date().addingTimeInterval(30)
    var name: String
    let cardViewSubtitle: String
    let descripitonPlainText: String
    let releaseAtDateTimeString: String
}
