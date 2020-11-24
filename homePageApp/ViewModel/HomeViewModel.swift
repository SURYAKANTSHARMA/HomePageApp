//
//  HomeViewModel.swift
//  homePageApp
//
//  Created by tokopedia on 22/11/20.
//

import Foundation

class HomeViewModel {
    let categoryService: NetworkInterface
    let themeService: NetworkInterface
    var categories: [Category] = []
    var themes: [Theme] = []
    var selectedIndex = 0
    
    init(categoryService: NetworkInterface, themeService: NetworkInterface) {
        self.categoryService = categoryService
        self.themeService = themeService
    }
    
    func fetchCategory(callback: @escaping (Result<[Category], Error>) -> Void) {
        categoryService.getData { (result: Result<[Category], Error>) in
            categories = try! result.get()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 5)) {
                callback(result)
            }
        }
    }
    
    
    func fetchTheme(callback: @escaping (Result<[Theme], Error>) -> Void) {
        themeService.getData { (result: Result<[Theme], Error>) in
            themes = try! result.get()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: 5)) {
                callback(result)
            }
        }
    }
    
    
}
