//
//  ChatsCoordinator.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 12.12.2021.
//

import UIKit

class ChatCoordinator: Coordinator {
    weak var parentCoordinator: AppCoordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ChatViewModel()
        let vc = ChatsViewController.instantiate(withStoryboardName: "Main")
        vc.viewModel = viewModel
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    deinit {
        print("deinit")
    }
}
