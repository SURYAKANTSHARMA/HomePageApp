//
//  HomeViewModel.swift
//  homePageApp
//
//  Created by tokopedia on 22/11/20.
//

import Foundation
import CoreGraphics

enum MenuItemType: Int, CaseIterable {
    case category
    case theme
    case trending
}

class HomeViewModel {
    let categoryService: NetworkInterface
    let themeService: NetworkInterface
    let trendService: NetworkInterface
    var array: [Nameable] = []
    var selectedIndex = 0
    
    init(categoryService: NetworkInterface, themeService: NetworkInterface,
        trendService: NetworkInterface) {
        self.categoryService = categoryService
        self.themeService = themeService
        self.trendService = trendService
    }
    
    func fetchCategory(callback: @escaping (Result<[Category], Error>) -> Void) {
        categoryService.getData { (result: Result<[Category], Error>) in
            array = try! result.get()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 5)) {
                callback(result)
            }
        }
    }
    
    
    func fetchTheme(callback: @escaping (Result<[Theme], Error>) -> Void) {
        themeService.getData { (result: Result<[Theme], Error>) in
            array = try! result.get()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 5)) {
                callback(result)
            }
        }
    }
    
    func fetchTrend(callback: @escaping (Result<[Trend], Error>) -> Void) {
        trendService.getData { (result: Result<[Trend], Error>) in
            array = try! result.get()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 5)) {
                callback(result)
            }
        }
    }
    
    
    func fetchData(type: MenuItemType = .category, callback: @escaping ([Nameable]) -> Void) {
        switch type {
        case .category:
            fetchCategory { result in
                callback(try! result.get())
            }
        case .theme:
            fetchTheme { result in
                callback(try! result.get())
            }
        case .trending:
            fetchTrend { result in
                callback(try! result.get())
            }
        }
    }

}

// MARK :- HomeViewModel Extensions
internal extension HomeViewModel {
    func getSize(viewWidth: CGFloat) -> CGSize {
        let menuType = MenuItemType(rawValue: selectedIndex)!
        switch menuType {
        case .category:
            return CGSize(width: viewWidth, height: 100)
        case .theme:
            return CGSize(width: viewWidth/2-20, height: 200)
        case .trending:
            return CGSize(width: viewWidth, height: 100)
        }
    }
    
    func cellIdentifier() -> String {
        let menuType = MenuItemType(rawValue: selectedIndex)!
        switch menuType {
        case .category:
            return String(describing: CollectionViewCell.self)
        case .theme:
            return String(describing: ThemeCell.self)
        case .trending:
            return String(describing: TrendingCell.self)
        }
    }
}
