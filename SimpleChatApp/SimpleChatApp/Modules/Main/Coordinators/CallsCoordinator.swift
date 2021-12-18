//
//  CallsCoordinator.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 13.12.2021.
//

import UIKit

class CallsCoordiantor: Coordinator {
    weak var parentCoordinator: AppCoordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = CallsViewModel()
        let vc = CallsViewController.instantiate(withStoryboardName: "Main")
        vc.viewModel = viewModel
        self.navigationController.pushViewController(vc, animated: true)
    }
}
