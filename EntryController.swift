//
//  EntryController.swift
//  Journal
//
//  Created by Karl Pfister on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class EntryController {
    
    static let sharedInstance = EntryController() //sharedInstance is a Singleton
    
    var entries = [Entry]()
    
    
    func addEntry(entry: Entry) {
        entries.append(entry)
        
    }
    
    func deletePlaylist(entry: Entry){
            guard let indexOfEntry = entries.indexOf(entry) else {
                return
            }
            entries.removeAtIndex(indexOfEntry)
    
    }

}