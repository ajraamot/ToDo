//
//  ItemManagerXCTest.swift
//  ToDo
//
//  Created by Raamot, Andrew on 10/22/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import XCTest

@testable import ToDo

class ItemManagerXCTest: XCTest {
    var sut: ItemManager!
    // sut = system under test
    override func setUp() {
        super.setUp()
        sut = ItemManager()
    }
    func test_always_passes() {
        XCTAssertEqual("test", "test")
        
    }
    
//    func test_CheckItemAt_RemovesItFromToDoItems() {
//        let first = ToDoItem(title: "First")
//        let second = ToDoItem(title: "Second")
//        sut.add(first)
//        sut.add(second)
//        
//        sut.checkItem(at: 0)
//        
//        XCTAssertEqual(sut.item(at: 0).title, "Second") 
//    }
}
