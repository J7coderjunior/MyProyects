//
//  ViewController.swift
//  TodoList
//
//  Created by J7CODER on 13-07-22.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    private let table: UITableView  =  {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        title = "Todo List"
        table.dataSource = self
    }


}

