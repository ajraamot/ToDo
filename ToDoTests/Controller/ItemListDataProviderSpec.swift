//
//  ItemListDataProviderSpec.swift
//  ToDo
//
//  Created by Raamot, Andrew on 11/5/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

// leaving off https://www.packtpub.com/mapt/book/all_books/9781787129078/4/ch04lvl1sec26/implementing-itemlistdataprovider
// "Run the tests. Now, the last added test succeeds."

import Nimble
import Quick

@testable import ToDo

class ItemListDataProviderSpec: QuickSpec {
    
    override func spec() {
        describe("ItemListDataProvider") {
            var sut: ItemListDataProvider!
            var tableView: UITableView!
            var controller: ItemListViewController!

            beforeEach() {
                sut = ItemListDataProvider()
                sut.itemManager = ItemManager()
                
                tableView = UITableView()
                tableView.dataSource = sut
                tableView.delegate = sut
                super.setUp()
                
                
                sut = ItemListDataProvider()
                sut.itemManager = ItemManager()
                
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                controller = storyboard.instantiateViewController(
                    withIdentifier: "ItemListViewController") as! ItemListViewController
                
                
                _ = controller.view 
                
                
                tableView = controller.tableView 
                tableView.dataSource = sut
            }
            it("The table view has two sections—one for unchecked items and the other for checked items.") {
                let numberOfSections = tableView.numberOfSections
                expect(numberOfSections).to(equal(2))

            }
            it("Number of rows in first section is toDoCount") {
                sut.itemManager?.add(ToDoItem(title: "Foo"))
                // TODO: does not compile "Cannot convert value of type 'ToDoItem' to expected argument type 'ToDoItem'"
                
                expect(tableView.numberOfRows(inSection: 0)).to(equal(1))

                sut.itemManager?.add(ToDoItem(title: "Bar"))
                tableView.reloadData() // otherwise it caches numberOfRows()

                expect(tableView.numberOfRows(inSection: 0)).to(equal(2))
            }
            it("to make sure the number of rows in the second section is the same as the number of completed items in the item manager") {
                sut.itemManager?.add(ToDoItem(title: "Foo"))
                sut.itemManager?.add(ToDoItem(title: "Bar"))
                sut.itemManager?.checkItem(at: 0)
                
                expect(tableView.numberOfRows(inSection: 1)).to(equal(1))
                
                sut.itemManager?.checkItem(at: 0)
                tableView.reloadData() 
                
                expect(tableView.numberOfRows(inSection: 1)).to(equal(2))
            }
            it("makes sure that tableView(_:cellForRowAt:) returns our custom cell") {
                sut.itemManager?.add(ToDoItem(title: "Foo"))
                tableView.reloadData()
                
                let cell = tableView.cellForRow(at: IndexPath(row: 0,
                                                              section: 0))
                expect(cell).to(beAnInstanceOf(ItemCell.self))
            }

            it("dequeues Cell from TableView") {
                let mockTableView = MockTableView.mockTableView(withDataSource: sut)
                // see mockTableView defined at bottom of this file
                mockTableView.dataSource = sut
                mockTableView.register(ItemCell.self,
                                       forCellReuseIdentifier: "ItemCell")
                
                sut.itemManager?.add(ToDoItem(title: "Foo"))
                mockTableView.reloadData()
                
                _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
                
                expect(mockTableView.cellGotDequeued).to(beTrue())
            }
            
            it("CellForRow calls config cell") {
//                let mockTableView = MockTableView.mockTableView(withDataSource: sut)
                let mockTableView = MockTableView(
                    frame: CGRect(x: 0, y:0, width: 320, height: 480),
                    style: .plain)
                mockTableView.dataSource = sut
                mockTableView.register(MockItemCell.self,
                                       forCellReuseIdentifier: "ItemCell")
                
                let item = ToDoItem(title: "Foo")
                sut.itemManager?.add(item)
                mockTableView.reloadData()
                
                let cell = mockTableView
                    .cellForRow(at: IndexPath(row: 0, section: 0)) as! MockItemCell 
                expect(cell.catchedItem).to(equal(item))
            }
            
            it("CellForRow In Section Two - Calls Config Cell With Done Item") {
                let mockTableView = MockTableView.mockTableView(withDataSource: sut)
                mockTableView.dataSource = sut
                mockTableView.register(MockItemCell.self,
                                       forCellReuseIdentifier: "ItemCell")
                
                sut.itemManager?.add(ToDoItem(title: "Foo"))
                
                let second = ToDoItem(title: "Bar")
                sut.itemManager?.add(second)
                sut.itemManager?.checkItem(at: 1)
                mockTableView.reloadData()

                let cell = mockTableView 
                    .cellForRow(at: IndexPath(row: 0, section: 1)) as! MockItemCell 
                
                expect(cell.catchedItem).to(equal(second))
            }
            it("Delete button - in first section - shows title check") {
                let deleteButtonTitle = tableView.delegate?.tableView?(
                    tableView,
                    titleForDeleteConfirmationButtonForRowAt: IndexPath(row: 0, section: 0))

                expect(deleteButtonTitle).to(equal("Check"))
            }
            it("Delete button - in first section - shows title check") {
                let deleteButtonTitle = tableView.delegate?.tableView?(
                    tableView,
                    titleForDeleteConfirmationButtonForRowAt: IndexPath(row: 0, section: 1))
                
                expect(deleteButtonTitle).to(equal("Uncheck"))
            }
            it("CheckingAnItem_ChecksItInTheItemManager") {
                sut.itemManager?.add(ToDoItem(title: "Foo"))
                tableView.dataSource?.tableView?(tableView,
                                                 commit: .delete,
                                                 forRowAt: IndexPath(row: 0,
                                                                     section: 0))
                expect(sut.itemManager?.toDoCount).to(equal(0))
                expect(sut.itemManager?.doneCount).to(equal(1))
                expect(tableView.numberOfRows(inSection: 0)).to(equal(0))
                expect(tableView.numberOfRows(inSection: 1)).to(equal(1))
            }
            it("UncheckingAnItem_UnchecksItInTheItemManager") {
                sut.itemManager?.add(ToDoItem(title: "Foo"))
                sut.itemManager?.checkItem(at: 0)
                tableView.reloadData()
                tableView.dataSource?.tableView?(tableView,
                                                 commit: .delete,
                                                 forRowAt: IndexPath(row: 0,
                                                                     section: 1))
                expect(sut.itemManager?.toDoCount).to(equal(1))
                expect(sut.itemManager?.doneCount).to(equal(0))
                expect(tableView.numberOfRows(inSection: 0)).to(equal(1))
                expect(tableView.numberOfRows(inSection: 1)).to(equal(0))
            }
        }
    }
}

//  to define a mock of UITableView
extension ItemListDataProviderSpec {
    class MockTableView: UITableView {
        var cellGotDequeued = false
        
        override func dequeueReusableCell(
            withIdentifier identifier: String,
            for indexPath: IndexPath) -> UITableViewCell {
            
            cellGotDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier,
                                             for: indexPath)
            // The table view then checks whether there is a cell that can be reused. If not, it creates a new cell and returns it.
        }
        
        
        // the following class method creates a mock table view, sets the data source, and registers the mock table view cell
        class func mockTableView(
            withDataSource dataSource: UITableViewDataSource)
            -> MockTableView {
                let mockTableView = MockTableView(
                    frame: CGRect(x: 0, y: 0, width: 320, height: 480),
                    style: .plain)
                mockTableView.dataSource = dataSource
            mockTableView.register(MockItemCell.self, forCellReuseIdentifier: "ItemCell")
                return mockTableView
        }

    } 
}


// "To make sure that configCell(with:) is called after the cell is dequeued, we will write a test that uses a table view cell mock."
class MockItemCell : ItemCell {
    var catchedItem: ToDoItem?
    
    // override - p116-117
    override func configCell(with item: ToDoItem, checked: Bool = false) {
        if checked {
            let attributedString = NSAttributedString(
                string: item.title,
                attributes: [NSStrikethroughStyleAttributeName:
                    NSUnderlineStyle.styleSingle.rawValue])
            titleLabel.attributedText = attributedString
            locationLabel.text = nil
            dateLabel.text = nil
        } else {
            titleLabel.text = item.title
            locationLabel.text = item.location?.name
            if let timestamp = item.timestamp {
                let date = Date(timeIntervalSince1970: timestamp)
                dateLabel.text = dateFormatter.string(from: date)
            }
        }
    }
}
