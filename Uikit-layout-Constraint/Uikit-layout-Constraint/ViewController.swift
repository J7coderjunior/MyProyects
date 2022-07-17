//
//  ViewController.swift
//  Uikit-layout-Constraint
//
//  Created by J7CODER on 15-06-22.
//  Copyright © 2022 J7CODER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    //Load or add the customView
    override func loadView() {
        self.view = myOwnView();
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white;
        
    }
    


}

