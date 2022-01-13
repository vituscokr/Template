//
//  BoardType.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/13.
//

import Foundation

enum BoardType {
    case notice
    case faq
    case notification
    
    
    var title :String {
        switch(self) {
        case .notice:
            return "공지사항"
        case .faq:
            return "자주 묻는 질문"
        case .notification:
            return "알림"
        }
    }
    
    
}
