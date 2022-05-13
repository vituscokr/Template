//
//  ContentRepository.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/05/13.
//

import Foundation
import Combine
import LSSLibrary


class ContentRepository : ObservableObject {
    
    
    func writeContents() {
        
        var contents: [WidgetContent] = []
        for i in  1...10  {
          let content =  WidgetContent(
                
                name: "(\(i)",
                cardViewSubtitle: "\(i)",
                descripitonPlainText: """
\(i)
""",
                releaseAtDateTimeString: "\(i)")
            
            contents.append(content)
        }

        
        
//        let widgetContents = contents.map {
//
//
//        }
        
        let widgetContents = contents
        
        Debug.log(widgetContents) 
        
        
        let archiveURL = FileManager.sharedContainerURL()
            .appendingPathComponent("contents.json")
        
        let encoder = JSONEncoder()
        if let dataToSave = try? encoder.encode(widgetContents) {
            do {
                try dataToSave.write(to: archiveURL)
            } catch {
                Debug.log("Error : Can't write contents")
                return
            }
        }
        
    }
}
