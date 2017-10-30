//
//  ItemManager.swift
//  TDDiOSSwift
//
//  Created by Raamot, Andrew on 10/22/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import Foundation

class ItemManager {
    var toDoCount: Int { return toDoItems.count }
    var doneCount: Int { return doneItems.count }

    
    private var toDoItems: [ToDoItem] = []
    private var doneItems: [ToDoItem] = []
    
    func add(_ item: ToDoItem) {
        if !toDoItems.contains(item) {
            toDoItems.append(item)
        }
    }
    func item(at index: Int) -> ToDoItem {
        let foo = ToDoItem(title: "hi")
        add(foo)
        return toDoItems[index]
    }
    func checkItem(at index: Int) {
        let item = toDoItems.remove(at: index)
        doneItems.append(item)
    }
    func doneItem(at index: Int) -> ToDoItem {
        return toDoItems[index]
    }
    func removeAll() {
        toDoItems.removeAll()
        doneItems.removeAll()
    }
}

// leaving off at the beginning of ch 4 "A Test-Driven View Controller"
// https://www.packtpub.com/mapt/book/application_development/9781787129078/4
