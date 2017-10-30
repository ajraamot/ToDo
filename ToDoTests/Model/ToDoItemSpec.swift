//
//  ToDoItemSpec.swift
//  TDDiOSSwift
//
//  Created by Raamot, Andrew on 10/15/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import Quick
import Nimble

@testable import ToDo

class ToDoItemSpec: QuickSpec {
    override func spec() {
        describe("ToDoItemModel") {
            it("takes title") {
                let item = ToDoItem(title: "Foo")
                expect(item.title).to(equal("Foo"))
            }
            
            it("takes title and descrition") {
                let item = ToDoItem(title: "Foo", itemDescription: "Bar")
                expect(item.title).to(equal("Foo"))
                expect(item.itemDescription).to(equal("Bar"))
            }
            
            it("sets timestamp") {
                let item = ToDoItem(title: "", timestamp: 0.0)
                expect(item.timestamp).to(equal(0.0))
            }
            
            it("sets location") {
                let location = Location(name: "Foo")
                let item = ToDoItem(title: "", location: location)
                expect(item.location?.name).to(equal("Foo"))
            }
        }
        describe("ToDoItem equality") {
            it("are equal when minimal non-optionals are equal and the rest are nil"){
                let first = ToDoItem(title: "Foo")
                let second = ToDoItem(title: "Foo")
                
                expect(first) == (second)
            }
            it("are equal when all are same") {
                let first = ToDoItem(title: "Foo", itemDescription: "Bar", timestamp: 1.0, location: Location(name: "Blah"))
                let second = ToDoItem(title: "Foo", itemDescription: "Bar", timestamp: 1.0, location: Location(name: "Blah"))
                
                expect(first) == (second)
            }
            it("are not equal when locations differ") {
                let first = ToDoItem(title: "", location: Location(name: "Foo"))
                let second = ToDoItem(title: "", location: Location(name: "Bar"))
                
                expect(first) != (second)
            }
            it("are not equal when one location is nil and the other is not") {
                let first = ToDoItem(title: "", location: Location(name: "Foo"))
                let second = ToDoItem(title: "", location: nil)
                
                expect(first) != (second)
                expect(second) != (first)
            }
            it("are not equal when timestamps are different") {
                let first = ToDoItem(title: "Foo", timestamp: 1.0, location: Location(name: "Bar"))
                let second = ToDoItem(title: "Foo", timestamp: 2.0, location: Location(name: "Bar"))
                
                expect(first) != (second)
            }
            it("are not equal when descriptions are different") {
                let first = ToDoItem(title: "Foo", itemDescription: "Bar")
                let second = ToDoItem(title: "Foo", itemDescription: "Blah")
                
                expect(first) != (second)
            }
            it("are not equal when titles are different") {
                let first = ToDoItem(title: "Foo")
                let second = ToDoItem(title: "Bar")
                
                expect(first) != (second)
            }
        }
    }
}
