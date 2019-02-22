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
