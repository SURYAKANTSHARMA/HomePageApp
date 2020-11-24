//
//  CoordinatorProtocol.swift
//  homePageApp
//
//  Created by tokopedia on 24/11/20.
//
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}


