//
//  Event.swift
//  MDB Mini Project 3
//
//  Created by Sinjon Santos on 2/21/19.
//  Copyright © 2019 Sinjon Santos. All rights reserved.
//

import Foundation

class Event {
    var uid = ""
    var name: String
    var owner: String
    var date: String
    var desc: String
    var numInterested: Int
    
    
    init(withName name:String, ownedBy owner: String, dated date: String, description desc: String, interested numInterested: Int) {
        self.name = name
        self.owner = owner
        self.date = date
        self.desc = desc
        self.numInterested = numInterested
    }

//    required init(key: String, record: [String : Any?]) {
//        self.uid = key
//        self.name = record["name"] as! String
//        self.owner = record["owner"] as! String
//        self.date = record["date"] as! String
//        self.desc = record["description"] as! String
//        self.numInterested = record["interested"] as! Int
//    }
    
    func toDict() -> [AnyHashable: Any] {
        return ["name": name, "owner": owner, "date": date, "numInterested": numInterested, "description": desc]
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.date(from: self.date)!
    }
    
    
    
}
