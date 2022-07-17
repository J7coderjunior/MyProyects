//
//  MycustomView.swift
//  Uikit-layout-Constraint
//
//  Created by J7CODER on 16-06-22.
//  Copyright © 2022 J7CODER. All rights reserved.
//

import Foundation;
import UIKit;

final class myOwnView: UIView {
    
    //Important functions (onMissable)
    override init(frame: CGRect) {
        super.init(frame: .zero);
        
        setUp();
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var colors:  [UIColor] = [.green, .purple, .gray, .yellow, .orange,  .systemPink, .magenta, .systemTeal, .systemPink]
    
    private let costumButton : UIButton = {
        
        let myButton = UIButton();
        myButton.setTitle("Delete", for: .normal);
        myButton.setTitleColor(.white, for: .normal);
        myButton.backgroundColor = .blue;
        myButton.layer.cornerRadius = 14;
        //set fontSize to the title button
        myButton.titleLabel?.font = myButton.titleLabel?.font.withSize(30)
        // set shadow
        myButton.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1);  //ColorLiteral(property)
        myButton.layer.shadowOpacity = 1
        myButton.layer.shadowOffset = CGSize(width: 2.3, height: 3.5)
        //set border
        myButton.layer.borderWidth = 1;
        //set borderColor
        myButton.layer.borderColor = UIColor.red.cgColor;
        myButton.translatesAutoresizingMaskIntoConstraints = false;
        myButton.addTarget(self, action: #selector(myFunction), for: .touchUpInside)

        return myButton;
        
    }()
    
    
    private let costumButton2 : UIButton = {
        
        let myButton = UIButton();
        myButton.setTitle("Delete", for: .normal);
        myButton.setTitleColor(.white, for: .normal);
        myButton.backgroundColor = .green;
        myButton.layer.cornerRadius = 14;
        
        //set padding to the image of the button
        myButton.imageEdgeInsets = UIEdgeInsets(top: 4, left: 20, bottom: 6, right: 2)
        
        myButton.frame = CGRect(x: 0, y: 0, width: 84, height: 60)
        
        //set alignment of the text label of the button
        //myButton.contentHorizontalAlignment = .right
        
        //set fontSize to the title button
        myButton.titleLabel?.font = myButton.titleLabel?.font.withSize(30)
        myButton.setImage(UIImage(systemName: "arrow.down.to.line"), for: .normal)
        //set position of the image to the right o the text label button
        myButton.semanticContentAttribute = .forceRightToLeft
        //set border
        myButton.layer.borderWidth = 1;
        //set borderColor
        myButton.layer.borderColor = UIColor.red.cgColor;
        myButton.translatesAutoresizingMaskIntoConstraints = false;
        myButton.addTarget(self, action: #selector(myFunction2), for: .touchUpInside)

        return myButton;
        
    }()
    
    
    private func setUpUiButton_constraint(){
    
        NSLayoutConstraint.activate(   [
            
            //set (top,bottom,left and right custom position to the buttonView)
                //costumButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -500),
               //costumButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -200),
            
            //center the buttonView on the view screen
            costumButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            costumButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            //specify width and height of the buttonView
            costumButton.widthAnchor.constraint(equalToConstant: 300),
            costumButton.heightAnchor.constraint(equalToConstant: 60),
            
            costumButton2.heightAnchor.constraint(equalToConstant: 80)
            
            
            //set buttonwidth iqual to the view constraint width
            //costumButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            //costumButton.trailingAnchor.constraint(equalTo: trailingAnchor),
          
        ])
        
        
    }
    
    @objc func myFunction(){
        costumButton.backgroundColor = colors.shuffled()[0]
    }
    
    @objc func myFunction2(){
        costumButton2.backgroundColor = colors.shuffled()[0]
    }
    
    //ImageView
    private let myImageView: UIImageView  = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit;
        imageView.image = UIImage(named: "rickandmorty");
        // to add constraint to the imageView by coding!
        //the created view can not be seen without constraints
        imageView.translatesAutoresizingMaskIntoConstraints = false;
        return imageView;
    }()
    
    //labelView
    private let  myLabel :  UILabel =  {
        let textLabel = UILabel();
        textLabel.numberOfLines = 0;
        textLabel.textAlignment = .center
        textLabel.text = "welcome to my blog! J7 coder live view";
        textLabel.font = UIFont(name: "arial Rounded MT Bold", size: 26)
        textLabel.translatesAutoresizingMaskIntoConstraints = false;
        
        return textLabel;
    }()
    

    private func setUp(){
      
        //adding the new view
        [myImageView,myLabel,costumButton,costumButton2].forEach(addSubview);
        
        //adding constraint config of the views
        constraintConfig();
        
        //the button constraint config
         setUpUiButton_constraint()
    }
    
    
    private func constraintConfig(){
       
        //adding constraints to the imageView
        NSLayoutConstraint.activate([
            
            //label on the top of the imageView
            myLabel.bottomAnchor.constraint(equalTo: myImageView.topAnchor,constant: -30),
            
            costumButton2.bottomAnchor.constraint(equalTo: costumButton.bottomAnchor,constant: 150),
            
            //To the left side of the view contraint, the text of the label cant run out of the left view constraint side
            myLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            //To the right side of the view contraint, the text of the label cant run out of the right view constraint side
            myLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            // center the text label to center of the view constraint
            myLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            //on the top of the button view
            myImageView.bottomAnchor.constraint(equalTo: costumButton.topAnchor,constant: -30),
            
            //In the center of the screen
            //myImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            //Giving some marging(left,right) to the imageView not to stick on the view constraint sides
            myImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            //set left and right spacing to the view constraint
            costumButton2.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            costumButton2.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -50)
        

            //On the top with margin
            //myImageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor)
        ])
    }
}
