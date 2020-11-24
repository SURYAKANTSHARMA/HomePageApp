//
//  Model.swift
//  homePageApp
//
//  Created by tokopedia on 22/11/20.
//

import Foundation

struct Category: Codable {
    let name: String
}

struct Theme: Codable {
    let name: String
}

struct Trend: Codable {
    let name: String
    let offer: Double
}
