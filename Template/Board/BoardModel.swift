//
//  BoardModel.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/13.
//

import Foundation
import SwiftUI
import SwiftyJSON


class BoardModel : ObservableObject {
    
    @Published var item : [JSON] = [JSON]() 
    
    public init() {
        
    }
    
}
