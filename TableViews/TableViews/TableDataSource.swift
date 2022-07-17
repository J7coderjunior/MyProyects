//
//  TableDataSource.swift
//  TableViews
//
//  Created by J7CODER on 27-06-22.
//

import Foundation
import UIKit

let myDevices = [
    Devices(title: "MackBook pro", image: "macpro.gen3"),
    Devices(title: "Pantalla", image: "display.2"),
    Devices(title: "Television", image: "appletv"),
    Devices(title: "Mini mac", image: "macmini"),
    Devices(title: "Laptop", image: "laptopcomputer")
]

let workDevices = [
    Devices(title: "Iphone", image: "iphone"),
    Devices(title: "Ipad", image: "ipad"),
    Devices(title: "Airpods", image: "airpods"),
    Devices(title: "Applewatch", image: "applewatch"),
]

let allDevices = [myDevices, workDevices]

final class TableDataSource:  NSObject, UITableViewDataSource {
    
    private let dataSource :  [[Devices]]
    
    init(dataSource: [[Devices]]) {
        self.dataSource = dataSource
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! myTableViewCell
        let model = dataSource[indexPath.section][indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "House Devices" : "Work Devices"
    }
}
