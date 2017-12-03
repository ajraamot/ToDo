//
//  DetailViewControllerSpec.swift
//  ToDo
//
//  Created by Raamot, Andrew on 11/19/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import Nimble
import Quick

@testable import ToDo

class DetailViewControllerSpec: QuickSpec {
    override func spec() {
        describe("DetailViewController") {
            
            beforeEach() {
            }
            it("HasTitleLabel") {
                let storyboard = UIStoryboard(name: "Main",
                                              bundle: nil)
                let sut = storyboard
                    .instantiateViewController(
                        withIdentifier: "DetailViewController")
                    as! DetailViewController
                _ = sut.view
                expect(sut.titleLabel).toNot(beNil())
            }
        }
    }
}
