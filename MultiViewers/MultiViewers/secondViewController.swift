//
//  secondViewController.swift
//  MultiViewers
//
//  Created by J7CODER on 30-06-22.
//

import UIKit

class secondViewController: UIViewController {

    private let myButton : UIButton = {
        let button = UIButton()
        
        button.layer.cornerRadius = 10;
        button.setTitle("Push up", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(25);
        button.setTitleColor(UIColor.blue, for: .normal)
        button.backgroundColor = .white;
        button.layer.borderWidth = 3;
        button.layer.borderColor    = UIColor.blue.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Second view controller";
        view.addSubview(myButton)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Atras", style: .done, target: self, action: #selector(homeView))
        
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myButton.widthAnchor.constraint(equalToConstant: 200),
            myButton.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc func homeView(){
        self.navigationController?.popToRootViewController(animated: true)
        
        
    }
    
    @objc func showAlert(){
        let alert = UIAlertController(title: "Bienvenido", message: "J7coder will be rich", preferredStyle: .alert)
   
                    alert.addAction(UIAlertAction(title: "No",style: .destructive, handler: {_ in
                        self.pintar()
                    }))
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert,animated: true)
    }
    
  func pintar(){
        print("Hola crack!")
    }
}
