//
//  ItemListViewControllerTest.swift
//  ToDo
//
//  Created by Raamot, Andrew on 10/28/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import Nimble
import Quick

@testable import ToDo

class ItemListViewControllerTest: QuickSpec {
    override func spec() {
        describe("ItemListViewController") {
            it("TableView is not nil after view did load") {
                let sut = ItemListViewController()
                _ = sut.view // triggers the call to viewDidLoad()
                expect(sut.tableView).toNot(equal(nil))
                
                
            }
        }
    }
}
