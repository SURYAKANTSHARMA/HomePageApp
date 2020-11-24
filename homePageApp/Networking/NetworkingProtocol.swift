//
//  NetworkingProtocol.swift
//  homePageApp
//
//  Created by tokopedia on 23/11/20.
//

import Foundation

protocol NetworkInterface {
    func getData<T: Decodable>(callback:(Result<[T], Error>)-> Void)
}
