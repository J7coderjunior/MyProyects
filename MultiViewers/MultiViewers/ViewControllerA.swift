//
//  ViewController.swift
//  MultiViewers
//
//  Created by J7CODER on 30-06-22.
//

import UIKit

class ViewControllerA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First view controller";
        view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Siguiente", style: .done, target: self, action: #selector(nextViewController))
    }

    @objc func nextViewController(){
        self.navigationController?.pushViewController(secondViewController(), animated: true)
    }
}

