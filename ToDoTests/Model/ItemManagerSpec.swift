//
//  ItemManagerSpec.swift
//  TDDiOSSwift
//
//  Created by Raamot, Andrew on 10/15/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import Quick
import Nimble

@testable import ToDo

class ItemManagerSpec: QuickSpec {
    override func spec() {
        describe("ItemManager") {
            var sut: ItemManager!
            // sut = system under test
            beforeEach() {
                sut = ItemManager()
            }
            it("toDoCount initially equals zero") {
                expect(sut.toDoCount).to(equal(0))
            }
            it("doneCount initially equals zero") {
                expect(sut.doneCount).to(equal(0))
            }

            it("adding an item increases count to one") {
                let item = ToDoItem(title: "test")
                sut.add(item)
                expect(sut.toDoCount).to(equal(1))
            }
            it("adding an item increases count to one") {
                let item: ToDoItem = ToDoItem(title: "Foo")
                sut.add(item)
                let returnedItem: ToDoItem = sut.item(at: 0)
                expect(returnedItem.title).to(equal(item.title))
            }
            it("check item at changes count") {
                sut.add(ToDoItem(title: "Bar"))
                sut.checkItem(at: 0)
                expect(sut.toDoCount).to(equal(0))
                expect(sut.doneCount).to(equal(1))
            }
            it("check item at changes count") {
                let first = ToDoItem(title: "First")
                let second = ToDoItem(title: "Second")
                sut.add(first)
                sut.add(second)

                sut.checkItem(at: 0)
                
                expect(sut.item(at: 0).title).to(equal("Second"))
            }
            
//            // p110 - I included these next two tests, because the book didn't include them
            it("uncheck item at changes count") {
                sut.add(ToDoItem(title: "Bar"))
                sut.checkItem(at: 0)
                sut.uncheckItem(at:0)
                expect(sut.toDoCount).to(equal(1))
                expect(sut.doneCount).to(equal(0))
            }
            it("uncheck item at changes count") {
                let first = ToDoItem(title: "First")
                let second = ToDoItem(title: "Second")
                sut.add(first)
                sut.add(second)
                
                sut.checkItem(at: 0)
                sut.uncheckItem(at: 0)
                expect(sut.item(at: 0).title).to(equal("First"))
                expect(sut.item(at: 1).title).to(equal("Second"))
            }

            it("doneItemAt returns checked item") {
                let item = ToDoItem(title: "Foo")
                sut.add(item)
                
                sut.checkItem(at: 0)
                let returnedItem = sut.doneItem(at: 0)
                expect(returnedItem.title).to(equal(item.title))
            }
            it("removing all results in counts being zero") {
                let foo: ToDoItem = ToDoItem(title: "Foo")
                sut.add(foo)
                sut.add(ToDoItem(title: "Bar"))
                sut.checkItem(at: 0)
                
                expect(sut.toDoCount).to(equal(1))
                expect(sut.doneCount).to(equal(1))
                sut.removeAll()
                expect(sut.toDoCount).to(equal(0))
                expect(sut.doneCount).to(equal(0))
            }
            it("does not add duplicates") {
                sut.add(ToDoItem(title: "Foo"))
                sut.add(ToDoItem(title: "Foo"))
                
                expect(sut.toDoCount).to(equal(1))
            }
        }
    }
}
