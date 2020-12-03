//
//  ViewController.swift
//  homePageApp
//
//  Created by tokopedia on 22/11/20.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    weak var coordinator: Coordinator?
    
    let viewModel: HomeViewModel
    
    lazy var segmentControl: UISegmentedControl = {
        let items = ["Category", "Themes", "Trending"]
        let segmentControl = UISegmentedControl(items: items)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(segmentControlDidChanged(_:)), for: .valueChanged)
        return segmentControl
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .white
        //cv.backgroundColor = .green
        return cv
    }()
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Explore"
        addSegmentControl()
        setUpCollectionView()
        fetchCategory()
    }
    
    private func fetchCategory() {
        view.addSubview(activityIndicator)
        activityIndicator.center = view.center
        viewModel.fetchData { _ in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.collectionView.reloadData()
            }
        }
    }
    
    @objc private func segmentControlDidChanged(_ segment: UISegmentedControl) {
        self.viewModel.selectedIndex = segment.selectedSegmentIndex
        viewModel.fetchData(type: MenuItemType(rawValue: segment.selectedSegmentIndex)!) { _ in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    private func addSegmentControl() {
        view.addSubview(segmentControl)
        segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setUpCollectionView() {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CollectionViewCell.self))
        collectionView.register(ThemeCell.self, forCellWithReuseIdentifier: String(describing: ThemeCell.self))
        collectionView.register(TrendingCell.self, forCellWithReuseIdentifier: String(describing: TrendingCell.self))
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 8).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
            .isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
            .isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            .isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.cellIdentifier(), for: indexPath) as! CellProtocol
        if let cell = cell as? CollectionViewCell {
            cell.button.setTitle(viewModel.array[indexPath.row].name, for: .normal)
        } else if let cell = cell as? ThemeCell {
          // do some customization
            cell.titleLabel.text = viewModel.array[indexPath.row].name
        }
        return cell as! UICollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         viewModel.getSize(viewWidth: view.frame.width)
    }
}
