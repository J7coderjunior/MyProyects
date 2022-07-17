//
//  myCostumViews.swift
//  myComponents
//
//  Created by J7CODER on 27-06-22.
//

import Foundation
import UIKit

final class MyViews: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var counter: Int = 0 ;
    var colors: [UIColor] = [.blue,.green, .systemPurple, .black, .systemPink, .red];
    
    private var MyLabel : UILabel = {
        var myLabel  = UILabel ()
        myLabel.text = "Welcome to my blog";
        myLabel.textColor = .blue;
        myLabel.textAlignment = .left;
        myLabel.font = UIFont(name: "Arial", size: 40);
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return myLabel;
    } ()
    
    private var  MyCirculo : UIButton = {
        //set costum to the button view
        let myCirculo = UIButton ()
        myCirculo.layer.backgroundColor = UIColor.white.cgColor;
        myCirculo.layer.borderWidth = 6;
        myCirculo.layer.borderColor = UIColor.blue.cgColor;
        myCirculo.layer.cornerRadius = 80;
        myCirculo.setTitleColor(.black, for: .normal);
        myCirculo.titleLabel?.font = myCirculo.titleLabel?.font.withSize(40);
        myCirculo.translatesAutoresizingMaskIntoConstraints = false;
        return myCirculo
    }()
    
    
    private var MyButton: UIButton = {
        let myButton = UIButton()
        myButton.addTarget(self, action: #selector(myFunction), for:  .touchUpInside)
        myButton.layer.cornerRadius = 14;
        myButton.layer.borderWidth = 2;
        myButton.setTitleColor(.blue,for: .normal )
        myButton.layer.borderColor = UIColor.blue.cgColor;
        myButton.setTitle("Pess me", for: .normal);
        myButton.titleLabel?.font = myButton.titleLabel?.font.withSize(30);
        myButton.translatesAutoresizingMaskIntoConstraints = false;
        return myButton
    }()
    private var myTextFields : UITextField = {
        //set style to the textField
        let myTextField  = UITextField()
        myTextField.font = .systemFont(ofSize: 30)
        myTextField.layer.borderColor = UIColor.blue.cgColor;
        myTextField.layer.borderWidth = 2;
        myTextField.layer.cornerRadius = 6;
        myTextField.textColor = UIColor.black;
        myTextField.layer.backgroundColor = UIColor.lightGray.cgColor;
        myTextField.textAlignment = .center
        myTextField.placeholder = "Just text";
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        return myTextField
    }()
    
    func setUp(){
        //adding view
        [MyLabel,MyCirculo,MyButton,myTextFields].forEach(addSubview)
        
        MyCirculo.setTitle("\(counter)", for: .normal)
    
        NSLayoutConstraint.activate([
            
            MyLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor,constant: 30),
            MyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
           
            
            myTextFields.topAnchor.constraint(equalTo: MyLabel.bottomAnchor,constant: 40),
            myTextFields.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            myTextFields.widthAnchor.constraint(equalToConstant: 300),
            myTextFields.heightAnchor.constraint(equalToConstant: 60),
            
            MyCirculo.topAnchor.constraint(equalTo: myTextFields.bottomAnchor, constant: 40),
            MyCirculo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 140),
            MyCirculo.widthAnchor.constraint(equalToConstant: 160),
            MyCirculo.heightAnchor.constraint(equalToConstant: 160),
            
            MyButton.topAnchor.constraint(equalTo: MyCirculo.bottomAnchor, constant: 40),
            MyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 120),
            MyButton.widthAnchor.constraint(equalToConstant: 200),
            MyButton.heightAnchor.constraint(equalToConstant: 60),
            
        ])
   
        
    }
    
    
    func setColor(color : UIColor){
        MyCirculo.setTitleColor(color, for: .normal)
    }
    
    @objc func myFunction () {
        counter += 1;
        MyCirculo.backgroundColor = colors.shuffled()[0]
        myTextFields.textAlignment = .center;
        myTextFields.borderStyle = .roundedRect;
        myTextFields.font = .systemFont(ofSize: 30)
        myTextFields.backgroundColor = UIColor.lightGray
        myTextFields.textColor = UIColor.white;
        
        if MyCirculo.backgroundColor == UIColor.black {
            setColor(color: .white)
        }else{
            setColor(color: .black)
        }
        
    }
}
