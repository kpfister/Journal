//
//  Entry.swift
//  Journal
//
//  Created by Karl Pfister on 5/11/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Entry:Equatable {
    
    
    var timeStamp: NSDate
    var title: String
    var bodyText: String
    
    private let kTimestamp = "timeStamp"
    private let kTitle = "title"
    private let kBodytext = "bodytext"
    
    var dictionaryCopy: [String: AnyObject] {
        return [kTimestamp: timeStamp, kTitle: title, kBodytext: bodyText]
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let timestamp = dictionary[kTimestamp] as? NSDate,
            title = dictionary[kTitle] as? String,
            bodytext = dictionary[kBodytext] as? String else {
                return nil
        }
        self.timeStamp = timestamp
        self.title = title
        self.bodyText = bodytext
    }
    
    
    
    init(timeStamp: NSDate, title: String, bodytext: String) {
        self.timeStamp = NSDate()
        self.title = title
        self.bodyText = bodytext
    }
    
}

func ==(lhs: Entry, rhs: Entry) -> Bool {
    return lhs.timeStamp == rhs.timeStamp && lhs.title == rhs.title && lhs.bodyText == rhs.bodyText
}
