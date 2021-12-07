//
//  MainCoordinator.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 16.11.2021.
//

import UIKit
import Foundation

class MainCoordinator: Coordinator {
    weak var parentCoordinator: AppCoordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MainTabBarViewController.instantiate(withStoryboardName: "Main")
        vc.coordinator = self
        self.navigationController.viewControllers = [vc]
    }

}
