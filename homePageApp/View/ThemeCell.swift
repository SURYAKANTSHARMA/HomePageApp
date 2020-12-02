//
//  ThemeCell.swift
//  homePageApp
//
//  Created by SuryaKant Sharma on 02/12/20.
//

import UIKit

protocol CellProtocol: AnyObject {
    
}
class ThemeCell: UICollectionViewCell, CellProtocol {
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8)
            .isActive = true
        imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.image = #imageLiteral(resourceName: "unsplash1")
        addCornerRadiusAndShadow()
    }
    
    private func addCornerRadiusAndShadow() {
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 5
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 2, height: 2)
        contentView.layer.shadowOpacity = 0.7
        contentView.layer.shadowRadius = 2.0
        //contentView.backgroundColor = .lightGray
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

