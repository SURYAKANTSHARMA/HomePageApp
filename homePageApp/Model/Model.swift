//
//  Model.swift
//  homePageApp
//
//  Created by tokopedia on 22/11/20.
//

import Foundation

protocol Nameable {
    var name: String {get}
}
struct Category: Codable, Nameable {
    let name: String
}

struct Theme: Codable, Nameable {
    let name: String
}

struct Trend: Codable, Nameable {
    let name: String
    let offer: Double
}
