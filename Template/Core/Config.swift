//
//  Config.swift
//  Template
//
//  Created by Gyeongtae Nam on 2022/01/13.
//

import Foundation
import SwiftUI
import Realm

class RConfig :Object ,ObjectKeyIdentifiable{
    @Persisted (primaryKey: true) var key = ""
    @Persisted var value = ""
}

class Config {
    
    static var shared = Config()
    private lazy var configure  = {
        return Realm.Configuration(objectTypes: [RConfig.self])
    }()
    public var realm :Realm? {
        
        var realm : Realm?
        do {
            realm = try Realm(configuration:configure)
        }catch {
            
        }
        return realm
    }
    
    func getObject(key: ConfigKey) -> RConfig? {
       
        let object =  realm?.objects(RConfig.self).filter("key = %@", key.rawValue ).first
        return object 
    }
    
    ///default ""
    func save(key: ConfigKey , value: String) {

        if  let config = getObject(key: key ) {

            try! realm?.write{
               // config.key = key.rawValue
                config.value = value
            }
        }else {
            let config = RConfig()
            config.key = key.rawValue
            config.value = value
            
            try! realm?.write {
                realm?.add(config)
            }
        }


    }
        
    func read(_ key: ConfigKey) -> String  {
        guard let config = getObject(key: key ) else {
            return ""
        }
        return config.value
        
    }
    
    func del(_ key : ConfigKey ) {
        guard let config = getObject(key: key) else {
            return
        }
        
        try! realm?.write {
            realm?.delete(config)
        }
    }
    
}

