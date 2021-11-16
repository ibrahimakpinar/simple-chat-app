//
//  SignInCoordinator.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 11.11.2021.
//

import UIKit
import Foundation

class SignInCoordinator: Coordinator {
    weak var parentCoordinator: AppCoordinator?
    
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SignInViewController.instantiate(withStoryboardName: "SignIn")
        vc.viewModel = SignInViewModel()
        vc.coordinator = self
        self.navigationController.setNavigationBarHidden(true, animated: true)
        self.navigationController.pushViewController(vc, animated: true)
    }
    
  
}
