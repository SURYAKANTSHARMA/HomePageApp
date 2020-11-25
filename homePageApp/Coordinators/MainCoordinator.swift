//
//  MainCoordinator.swift
//  homePageApp
//
//  Created by tokopedia on 24/11/20.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    func start() {
        let viewModel = HomeViewModel(categoryService: CategoryService(), themeService: ThemeService(), trendService: TrendService())
        let homeVC = HomeViewController(viewModel: viewModel)
        homeVC.coordinator = self
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    init(navigationViewController: UINavigationController) {
        self.navigationController = navigationViewController
    }
    
    // Add custom methods to business flow
    func presentNotification() {
        let notificationController = NotificationViewController()
        notificationController.coordinator = self
        navigationController.pushViewController(notificationController, animated: true)
    }
}


class NotificationViewController: UIViewController {
    weak var coordinator: Coordinator?
}
