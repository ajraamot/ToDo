//
//  ItemCellSpec.swift
//  ToDo
//
//  Created by Raamot, Andrew on 11/18/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import Nimble
import Quick
@testable import ToDo

// p 110
class ItemCellSpec: QuickSpec {
    override func spec() {
        describe("ItemCell") {
            var tableView: UITableView!
            let dataSource = FakeDataSource()
            var cell: ItemCell!

            beforeEach() {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard
                    .instantiateViewController(withIdentifier: "ItemListViewController")
                    as! ItemListViewController
                _ = controller.view
                tableView = controller.tableView
                tableView?.dataSource = dataSource
                cell = tableView?.dequeueReusableCell(
                    withIdentifier: "ItemCell",
                    for: IndexPath(row: 0, section: 0)) as! ItemCell
            }
            
            it("HasNameLabel") {
                expect(cell.titleLabel).toNot(beNil())
            }
            
            it("HasLocationLabel") {
                expect(cell.locationLabel).toNot(beNil())
            }
            
            it("HasDateLabel") {
                expect(cell.dateLabel).toNot(beNil())
            }
            
//            // p114
//            it("SetsLabelTexts") {
//                let location = Location(name: "Bar")
//                let item = ToDoItem(title: "Foo",
//                                    itemDescription: nil,
//                                    timestamp: 1456150025,
//                                    location: location)
//                cell.configCell(with: item)
//                expect(cell.titleLabel.text).to(equal("Foo"))
//                expect(cell.locationLabel.text).to(equal("Bar"))
//                expect(cell.dateLabel.text).to(equal("02/22/2016"))
//            }
//            it("Title_WhenItemIsChecked_IsStrokeThrough") {
//                let location = Location(name: "Bar")
//                let item = ToDoItem(title: "Foo",
//                                    itemDescription: nil, timestamp: 1456150025,
//                                    location: location)
//                cell.configCell(with: item, checked: true)
//                let attributedString = NSAttributedString(
//                    string: "Foo",
//                    attributes: [NSStrikethroughStyleAttributeName:
//                        NSUnderlineStyle.styleSingle.rawValue])
//                expect(cell.titleLabel.attributedText).to(equal(attributedString))
//                expect(cell.locationLabel).to(beNil())
//                expect(cell.dateLabel).to(beNil())
//            }
        }
    }
}


/*
 from p 110:
 To be able to present the data on screen, ItemCell needs labels. We will add the labels in Interface Builder (IB). This means that to test whether the label is set up when the table view cell is loaded, we need to set up the loading similar to how it will be in the app. The table view needs a data source, but we don't want to set up the real data source, because then, we will also need an item manager. Instead, we will use a fake object to act as the data source.
 */
extension ItemCellSpec {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView,
                       numberOfRowsInSection section: Int) -> Int {
            return 1 }
        func tableView(_ tableView: UITableView,
                       cellForRowAt indexPath: IndexPath)
            -> UITableViewCell {
                return UITableViewCell()
        }
    }
}
