//
//  Country+CoreDataProperties.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/04/26.
//
//

import Foundation
import CoreData
import LSSLibrary

extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var shortName: String?
    @NSManaged public var candy: NSSet?

    public var wrappedShortName : String {
        shortName ?? "Unknown Country"
    }
    public var wrappedFullName : String {
        fullName ?? "Unknown Country"
    }
    
    public var candyArray : [Candy] {
        let set = candy as? Set<Candy> ?? []

        let array =  set.sorted {
            $0.warppedName < $1.warppedName
        }
        return array
        
    }
}

// MARK: Generated accessors for candy
extension Country {

    @objc(addCandyObject:)
    @NSManaged public func addToCandy(_ value: Candy)

    @objc(removeCandyObject:)
    @NSManaged public func removeFromCandy(_ value: Candy)

    @objc(addCandy:)
    @NSManaged public func addToCandy(_ values: NSSet)

    @objc(removeCandy:)
    @NSManaged public func removeFromCandy(_ values: NSSet)

}

extension Country : Identifiable {

}
