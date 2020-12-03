//
//  Trending.swift
//  homePageApp
//
//  Created by SuryaKant Sharma on 02/12/20.
//

import UIKit
class TrendingCell: UICollectionViewCell, CellProtocol {
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Pininterest"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var subtitleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .gray
        titleLabel.text = "slack"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var trendingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var trendingNumberView: TrendingNumberView = {
        let trendingNumberView = TrendingNumberView(frame: CGRect.zero)
        trendingNumberView.translatesAutoresizingMaskIntoConstraints = false
        return trendingNumberView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(trendingImageView)
        contentView.addSubview(trendingNumberView)
        
        trendingImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        trendingImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        trendingImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        trendingImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        titleLabel.leftAnchor.constraint(equalTo: trendingImageView.rightAnchor, constant: 8).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0).isActive = true
        trendingNumberView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        trendingNumberView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        //backgroundColor = .green
        trendingImageView.image = #imageLiteral(resourceName: "unsplash2")
        roundImageView()
    }
    
    private func roundImageView() {
        trendingImageView.layer.masksToBounds = true
        trendingImageView.layer.cornerRadius = 25
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class TrendingNumberView: UIView {
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "+ 5.70 %"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(label)
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        backgroundColor = .red
    }
}
