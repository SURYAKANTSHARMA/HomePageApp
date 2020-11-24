//
//  MenuBar.swift
//  homePageApp
//
//  Created by tokopedia on 22/11/20.
//

import UIKit

//class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    
//    lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor = UIColor.red
//        cv.dataSource = self
//        cv.delegate = self
//        return cv
//    }()
//    
//    let cellId = "cellId"
//    let imageNames = ["home", "trending", "subscriptions", "account"]
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
//        
//        addSubview(collectionView)
//        addConstraint(with)
//        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
//        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
//        
//        let selectedIndexPath = IndexPath(item: 0, section: 0)
//        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .bottom)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 4
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
//        
//        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
//        cell.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
//        
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: frame.width / 4, height: frame.height)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
//
//
