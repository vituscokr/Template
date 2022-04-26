//
//  Candy+CoreDataProperties.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/04/26.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    public var warppedName : String {
        name ?? "Unknown Candy"
    }

}

extension Candy : Identifiable {

}
