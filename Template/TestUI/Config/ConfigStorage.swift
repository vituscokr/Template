//
//  ConfigStorage.swift
//  Template
//
//  Created by vitus on 2022/04/22.
//

import Foundation
import CoreData
import Combine
import LSSLibrary

class ConfigStorage : NSObject , ObservableObject {
    
    var items = CurrentValueSubject<[Config], Never>([])
    
    static let shared : ConfigStorage = ConfigStorage()
    private let fetchController : NSFetchedResultsController<Config>
    
    
    private override init() {
        
        let fetchRequest: NSFetchRequest<Config> = Config.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "key", ascending: true)]
        
        fetchController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: PersistenceController.shared.container.viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        super.init()
        
        fetchController.delegate = self
        
        do {
            try fetchController.performFetch()
            items.value = fetchController.fetchedObjects ?? []
        }catch {
            Debug.log("Error : could not fetch objets ")
        }
    }
    
    func add() {
        
    }
    
    func upate() {
        
    }
    
    func delete() {
        
    }
}


extension ConfigStorage : NSFetchedResultsControllerDelegate {
    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        guard let items = controller.fetchedObjects as? [Config] else {
            return
        }
        self.items.value = items
    }
}

