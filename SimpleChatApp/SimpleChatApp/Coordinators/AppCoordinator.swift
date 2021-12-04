//
//  AppCoordinator.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 13.11.2021.
//

import UIKit
import Foundation
import FirebaseAuth

class AppCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
    }
    
    func start() {
        if Auth.auth().currentUser != nil {
            openMainFlow()
        
        } else {
            openLoginFlow()
        }
    }
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    func openLoginFlow() {
        let signInCoordinator = SignInCoordinator(navigationController: navigationController)
        signInCoordinator.parentCoordinator = self
        childCoordinator.append(signInCoordinator)
        signInCoordinator.start()
    }
    
    func openMainFlow() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        mainCoordinator.parentCoordinator = self
        childCoordinator.append(mainCoordinator)
        mainCoordinator.start()
    }
}
