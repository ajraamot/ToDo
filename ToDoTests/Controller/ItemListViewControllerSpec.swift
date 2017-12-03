//
//  ItemListViewControllerSpec.swift
//  ToDo
//
//  Created by Raamot, Andrew on 10/28/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import Nimble
import Quick

@testable import ToDo

class ItemListViewControllerSpec: QuickSpec {
    override func spec() {

        var sut: ItemListViewController!
        
        describe("ItemListViewController") {
            beforeEach() {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(
                    withIdentifier: "ItemListViewController")
                sut = viewController as! ItemListViewController
                _ = sut.view
            }
            it("TableView is not nil after view did load") {
                expect(sut.tableView).toNot(beNil())
            }
            it("Loading View sets TableViewDataSource") {
                expect(sut.tableView.dataSource).to(beAnInstanceOf(ItemListDataProvider.self))
                
            }
            it("Loading View sets Table View Delegate") {
                expect(sut.tableView.delegate).to(beAnInstanceOf(ItemListDataProvider.self))
            }
            it("The data source and delegate need to be the same instance because otherwise, selecting a cell could result in showing the details of a completely different item.") {
                expect(sut.tableView.dataSource as? ItemListDataProvider).to(be(sut.tableView.delegate as? ItemListDataProvider))
            }
            
        }
    }
}
