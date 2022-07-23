//
//  MyTableViewCell.swift
//  FyShopy
//
//  Created by J7CODER on 10-07-22.
//

import UIKit
class myTableViewCell: UITableViewCell {

    private let myImageView : UIImageView =  {
        let myImage = UIImageView()
        myImage.contentMode = .scaleAspectFit
        myImage.translatesAutoresizingMaskIntoConstraints = false
        return myImage;
    }()
    
    private let myLabel : UILabel =  {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let myLabelPrice : UILabel =  {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [myLabel,myLabelPrice,myImageView].forEach(addSubview)
   
    
        NSLayoutConstraint.activate([
            myImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant:12),
            myImageView.topAnchor.constraint(equalTo: topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            myImageView.widthAnchor.constraint(equalToConstant: 60),
            myImageView.heightAnchor.constraint(equalToConstant: 70),
            
            myLabel.leadingAnchor.constraint(equalTo: myImageView.leadingAnchor,constant: 90),
            myLabel.centerYAnchor.constraint(equalTo: myImageView.centerYAnchor),
            myLabelPrice.leadingAnchor.constraint(equalTo: myImageView.leadingAnchor,constant: 250),
            myLabelPrice.centerYAnchor.constraint(equalTo: myImageView.centerYAnchor),
          
        
   
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Producto){
        myImageView.image = UIImage(named: model.image);
        myLabel.text = model.title;
        myLabelPrice.text = "$ " + model.price;
        
    }
    

}
