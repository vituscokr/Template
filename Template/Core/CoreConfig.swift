//
//  CoreConfig.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/13.
//

import Foundation
import CoreData




//class CoreConfig {
//    static var shared = CoreConfig()
//    
//    let persistenceController = PersistenceController.shared
//    let viewContext :NSManagedObjectContext?
//    
//
//    
//
//    
//    init() {
//        self.viewContext =  persistenceController.container.viewContext
//    }
//
//    public func read(_ key : ConfigKey  ) -> String  {
//        @FetchRequest(
//            entity: Config.entity(),
//            predicate : NSPredicate(format: "key == %0" , key)
//        ) var configs : NSFetchRequest<Config>
//
//        
//        
//        return ""
//
//    }
//    
//    public func save(key: ConfigKey, value: String) {
//        
////        Config.key = key.rawValue
////        Config.value = value
////
////        saveContext()
//        
//    }
//    
//    func saveContext() {
//        
//    }
//}
