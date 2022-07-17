//
//  ViewController.swift
//  TableViews
//
//  Created by J7CODER on 27-06-22.
//

import UIKit

struct Devices {
    let title: String;
    let image : String;
}

class ViewController: UIViewController {
 
    private var dataSource : TableDataSource!
    private var delegate : TableViewDelegate!
    
    override func loadView() {
        let tableView = UITableView()
        self.dataSource = TableDataSource(dataSource: allDevices);
        self.delegate = TableViewDelegate()
        tableView.dataSource = dataSource;
        tableView.delegate = delegate;
        tableView.register(myTableViewCell.self, forCellReuseIdentifier: "mycell")
        view = tableView
    }
    
   
}

