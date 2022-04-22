//
//  Book.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/04/20.
//

import Foundation
import SwiftUI

class Book:ObservableObject {
    
    @Published var title : String = "책제목"
    let id = UUID()
    
}
