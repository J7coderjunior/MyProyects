//
//  ViewController.swift
//  DelegationPatern
//
//  Created by St Verty Vernard on 19-07-22.
//

import UIKit

class ViewController: UIViewController {

    let apiClient = ApiClient()
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        Button.addTarget(self, action: #selector(getDatas), for: .touchUpInside)
    }

    @objc func getDatas(){
        apiClient.getPokemons()
    }

}

