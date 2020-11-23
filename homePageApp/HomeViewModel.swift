//
//  HomeViewModel.swift
//  homePageApp
//
//  Created by tokopedia on 22/11/20.
//

import Foundation

struct HomeViewModel {
    func getCategories() -> [Category]{
         [
            Category(name: "Stock"),
            Category(name: "ETF"),
            Category(name: "Crypto"),
        ]
    
    }
}


