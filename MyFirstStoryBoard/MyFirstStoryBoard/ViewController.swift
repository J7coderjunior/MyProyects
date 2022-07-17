//
//  ViewController.swift
//  MyFirstStoryBoard
//
//  Created by J7CODER on 14-06-22.
//  Copyright © 2022 J7CODER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.textColor = .blue;
        myButton.setTitle("Just pressed", for: .normal)
        
    }
    
    @IBAction func myFirst_function(_ sender: Any) {
        print("User is suscribing");
    }
}

