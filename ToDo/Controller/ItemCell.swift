//
//  ItemCell.swift
//  ToDo
//
//  Created by Raamot, Andrew on 11/5/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    var configCellGotCalled: Bool = false
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    func configCell(with item: ToDoItem, checked: Bool = false) {
        configCellGotCalled = true
        titleLabel.text = item.title
        locationLabel.text = item.location?.name
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
    }
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()
}

//leaving off on "Using mocks"
//https://www.packtpub.com/mapt/book/all_books/9781787129078/4/ch04lvl1sec26/implementing-itemlistdataprovider


// "Replace the definition of the table view mock in the test with the following code:"
// https://www.packtpub.com/mapt/book/all_books/9781787129078/4/ch04lvl1sec26/implementing-itemlistdataprovider


// leaving off on p 112-113
