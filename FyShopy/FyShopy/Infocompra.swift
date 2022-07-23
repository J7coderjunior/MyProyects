//
//  Infocompra.swift
//  FyShopy
//
//  Created by J7CODER on 10-07-22.
//

import UIKit

class Infocompra: UIViewController {

    @IBOutlet weak var Total: UILabel!
    var total = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        Total.text = "$ " + String(total)
    }
    

 

}
