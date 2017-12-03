//
//  ItemListViewController.swift
//  ToDo
//
//  Created by Raamot, Andrew on 10/28/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
//    @IBOutlet var dataProvider: ItemListDataProvider!
//    @IBOutlet var dataProvider: UITableViewDataSource!
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate)!
    
    override func viewDidLoad() {
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
    }
}

// https://www.packtpub.com/mapt/book/application_development/9781787129078/4/ch04lvl1sec25/implementing-itemlistviewcontroller
// leaving off where it states "We will connect the data provider with an element in the storyboard."
