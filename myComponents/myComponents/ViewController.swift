//
//  ViewController.swift
//  myComponents
//
//  Created by J7CODER on 22-06-22.
//

import UIKit

class ViewController: UIViewController {

    override func loadView() {
        self.view = MyViews() ;
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

