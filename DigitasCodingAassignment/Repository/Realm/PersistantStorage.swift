//
//  PersistantStorage.swift
//  MobileAxxessCodingAssignment
//
//  Created by Shantaram K on 24/07/20.
//  Copyright © 2020 Shantaram Kokate. All rights reserved.
//

import UIKit
import RealmSwift

class PersistantStorage: NSObject {
    
    static let shared = PersistantStorage()
    
    // Database Path
    var dbPath: URL {
        
        let config = Realm.Configuration()

        return config.fileURL!
        
    }
    
    //get the Realm Reference: We need to open this path whenver we want to perform CURD Operation
    var realm: Realm? {
        do {
            let realm = try Realm()
            return realm
        } catch {
            print("error getting xml string: \(error)")
        }
        return nil
    }
}
