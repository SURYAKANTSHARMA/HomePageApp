//
//  TrendService.swift
//  homePageApp
//
//  Created by tokopedia on 25/11/20.
//

import Foundation

struct TrendService: NetworkInterface {
    
    func getData<T>(callback: (Result<T, Error>) -> Void) where T : Decodable {
        let categories: [Trend] = [
            Trend(name: "Pinterest", offer: 2.0),
            Trend(name: "Slack", offer: 3),
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
