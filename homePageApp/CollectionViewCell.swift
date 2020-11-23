//
//  CollectionViewCell.swift
//  homePageApp
//
//  Created by tokopedia on 22/11/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Replace me with original text"
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        contentView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: centerXAnchor)
            .isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor)
            .isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
