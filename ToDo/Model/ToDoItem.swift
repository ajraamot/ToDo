//
//  ToDoItem.swift
//  TDDiOSSwift
//
//  Created by Raamot, Andrew on 10/15/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import Foundation

struct ToDoItem : Equatable {
    let title: String
    let itemDescription: String?
    let timestamp: Double?
    let location: Location?
    
    init(title: String, itemDescription: String? = nil, timestamp: Double? = nil, location: Location? = nil) {
        self.title = title
        self.itemDescription = itemDescription
        self.timestamp = timestamp
        self.location = location
    }
}

func ==(lhs: ToDoItem, rhs: ToDoItem) -> Bool {
    return (lhs.title == rhs.title) && (lhs.itemDescription == rhs.itemDescription) && (lhs.timestamp == rhs.timestamp) && (lhs.location == rhs.location)
}
