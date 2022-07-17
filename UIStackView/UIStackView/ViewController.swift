//
//  ViewController.swift
//  UIStackView
//
//  Created by J7CODER on 27-06-22.
//

import UIKit

class ViewController: UIViewController {
    
    private let MyLabel : UILabel = {
        
    let label = UILabel()
        label.text = "Chose your prices!"
        label.font = .systemFont(ofSize: 40)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label;
    }()

    
    private let MyStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 25
        //stackView.alignment = .trailing
        //stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(MyStackView)
        view.addSubview(MyLabel)
        
     
        
        //array
        ["$1200","$34567","$67892","$8724556"].forEach{ price in
            let button = UIButton(type: .system);
            button.setTitle(price, for: .normal);
            button.setTitleColor(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1);
            button.layer.cornerRadius = 8;
            button.layer.borderWidth = 2;
            button.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1);
            button.titleLabel?.font = button.titleLabel?.font.withSize(30)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(systemName:"dollarsign.circle.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 60)), for: .normal)
            button.imageEdgeInsets = UIEdgeInsets(top: 4, left: -30, bottom: 6, right: 10)
            //button.frame = CGRect(x: 0, y: 0, width: 30, height: 56)
            
            //adding the button to the stackView
            MyStackView.addArrangedSubview(button)
            
            NSLayoutConstraint.activate([
                //button.widthAnchor.constraint(equalToConstant: 50),
                button.heightAnchor.constraint(equalToConstant: 60)
            ])
        
        }
        
        NSLayoutConstraint.activate([
            MyLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,constant: 20),
            MyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: 10),
            MyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            
            MyStackView.topAnchor.constraint(equalTo: MyLabel.bottomAnchor,constant: 20 ),
            MyStackView.leadingAnchor .constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            MyStackView.trailingAnchor.constraint(equalTo:  view.layoutMarginsGuide.trailingAnchor),
            
        ])
                                                    
    }


}

