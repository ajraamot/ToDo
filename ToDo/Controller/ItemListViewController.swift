//
//  ItemListViewController.swift
//  ToDo
//
//  Created by Raamot, Andrew on 10/28/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
    var tableView: UITableView?
    
    override func viewDidLoad() {
        tableView = UITableView()
    }
}

// https://www.packtpub.com/mapt/book/application_development/9781787129078/4/ch04lvl1sec25/implementing-itemlistviewcontroller
// leaving off where it states "Following the rules of TDD, we've done enough for now and the code looks clean"
