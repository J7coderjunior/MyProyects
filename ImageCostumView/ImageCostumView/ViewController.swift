//
//  ViewController.swift
//  ImageCostumView
//
//  Created by J7CODER on 24-06-22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.image = UIImage(named: "download")
        myImageView.translatesAutoresizingMaskIntoConstraints = false;
        myImageView.tintColor = .lightGray;
        myImageView.layer.cornerRadius = 100;
        myImageView.layer.borderWidth = 4;
        myImageView.layer.borderColor = UIColor.darkGray.cgColor ;
        myImageView.contentMode = .scaleAspectFit //default value to get the image into a normal form when the width and height are modified
        NSLayoutConstraint.activate([
            myImageView.widthAnchor.constraint(equalToConstant: 200),
            myImageView.heightAnchor.constraint(equalToConstant: 200),
            myImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            myImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           
        ])
        
    }


}

