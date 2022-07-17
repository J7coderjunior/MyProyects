//
//  TableViewDelegate.swift
//  TableViews
//
//  Created by J7CODER on 27-06-22.
//

import Foundation
import UIKit

final class TableViewDelegate : NSObject, UITableViewDelegate{
    

    //when some cell is being pressed
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = allDevices[indexPath.section][indexPath.row]
        print(model.title)
    }
}
