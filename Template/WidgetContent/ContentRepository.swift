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
                
                name: "(\(i)-iOS Concurrency with GCD and Operations",
                cardViewSubtitle: "\(i)iOS & Swift",
                descripitonPlainText: """
                                \(i) Learn how to add concurrency to your apps! \
                Keep your app’s UI responsive to give your \
                users a great user experience.
                """,
                releaseAtDateTimeString: "\(i) Jun 23 2020 • Video Course (3 hrs, 21 mins)")
            
            contents.append(content)
        }

        
        
//        let widgetContents = contents.map {
//
//
//        }
        
        let widgetContents = contents
        
        Debug.log(widgetContents) 
        
        
        let archiveURL = FileManager.sharedContainerURL()
            .appendingPathComponent("cotents.json")
        
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
