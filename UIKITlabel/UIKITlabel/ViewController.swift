//
//  ViewController.swift
//  UIKITlabel
//
//  Created by J7CODER on 19-06-22.
//

import UIKit

class ViewController: UIViewController {

    private let  costumLabel : UILabel = {
        let myLabel = UILabel()
        myLabel.text = "Welcome to my blog";
        myLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 30)
        myLabel.textAlignment = .center;
        myLabel.textColor = .purple;
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel;
    }()
    
    private let  costumLabel2 : UILabel = {
        let myLabel = UILabel()
        myLabel.text = "On my blog you will be able to learn cossing with severals programming languages";
        myLabel.font = .systemFont(ofSize: 16)
        myLabel.textAlignment = .left;
        myLabel.textColor = .black;
        myLabel.numberOfLines = 0
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        return myLabel;
    }()
    
    private let  costumLabel3 : UILabel = {
        
        let text = "How to costum a label text view with attributedText attribute"
        let styleTextList : [NSAttributedString.Key : Any] = [
            .underlineStyle : NSUnderlineStyle.single.rawValue,
            .underlineColor :UIColor.red,
            .backgroundColor : UIColor.blue,
            .foregroundColor : UIColor.white,
            .font : UIFont.systemFont(ofSize: 40)
        ]
        
        //we create a stense of NSattributedString and we give it the text and the style atribute list
        let myAttributeString = NSAttributedString(string: text,  attributes: styleTextList)
        let myLabel = UILabel()
        myLabel.numberOfLines = 0
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        //asign the atributedTextList to the label view
        myLabel.attributedText = myAttributeString
       
        return myLabel;
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //add the label view
        view.addSubview(costumLabel);
        view.addSubview(costumLabel2);
        view.addSubview(costumLabel3);
        
        //add constraint to the label view
        NSLayoutConstraint.activate([
            costumLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            costumLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            
            costumLabel2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            costumLabel2.topAnchor.constraint(equalTo: costumLabel.bottomAnchor,constant: 14),
            costumLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25),
            
            costumLabel3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            costumLabel3.topAnchor.constraint(equalTo: costumLabel2.bottomAnchor,constant: 15),
            costumLabel3.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25)
            
        ])
    }


}

