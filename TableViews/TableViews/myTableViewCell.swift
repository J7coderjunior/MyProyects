//
//  myTableViewCell.swift
//  TableViews
//
//  Created by J7CODER on 27-06-22.
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(myLabel)
        addSubview(myImageView)
        
        
        NSLayoutConstraint.activate([
            myImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant:10),
            myImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            myImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6),
            myImageView.widthAnchor.constraint(equalToConstant: 50),
            
            myLabel.leadingAnchor.constraint(equalTo: myImageView.leadingAnchor,constant: 80),
            myLabel.centerYAnchor.constraint(equalTo: myImageView.centerYAnchor),
        
   
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: Devices){
        myImageView.image = UIImage(systemName: model.image);
        myLabel.text = model.title;
        
    }
    

}
