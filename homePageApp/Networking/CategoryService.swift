//
//  CategoryService.swift
//  homePageApp
//
//  Created by tokopedia on 23/11/20.
//

import Foundation

struct CategoryService: NetworkInterface {
    
    func getData<T>(callback: (Result<T, Error>) -> Void) where T : Decodable {
        let categories: [Category] = [
            Category(name: "Stock"),
            Category(name: "ETF"),
            Category(name: "Crypto"),
        ]
        let jsonEncoder = JSONEncoder()
        let data = try! jsonEncoder.encode(categories)
        let jsonDecoder = JSONDecoder()
        do {
            let apiResponseModel = try jsonDecoder.decode(T.self, from: data)
            callback(.success(apiResponseModel))
        } catch {
            callback(.failure(error))
        }
    }

}


