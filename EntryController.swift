//
//  EntryController.swift
//  Journal
//
//  Created by Karl Pfister on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class EntryController {
    
    private let kEntry = "entry"
    
    static let sharedInstance = EntryController() //sharedInstance is a Singleton
    
    var entries = [Entry]()
    
    init() {
        loadFromPersistentStore()
    }
    
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        saveToPersistentStore()
    }
    
    func removeEntry(entry: Entry){
            guard let indexOfEntry = entries.indexOf(entry) else {
                return
            }
            entries.removeAtIndex(indexOfEntry)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        NSUserDefaults.standardUserDefaults().setObject(entries.map({$0.dictionaryCopy}), forKey:kEntry )
    }
    func loadFromPersistentStore() {
        guard let entryDictionary = NSUserDefaults.standardUserDefaults().objectForKey(kEntry) as? [[String: AnyObject]] else {
            return
        }
        entries = entryDictionary.flatMap({Entry(dictionary: $0)})
    }

}