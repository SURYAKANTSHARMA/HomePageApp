//
//  CollectionViewCell.swift
//  homePageApp
//
//  Created by tokopedia on 22/11/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 14
        button.backgroundColor = UIColor.rgb(red: 73, green: 83, blue: 198)
        //label.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        contentView.addSubview(button)
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
            .isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            .isActive = true
        button.centerYAnchor.constraint(equalTo: centerYAnchor)
            .isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
