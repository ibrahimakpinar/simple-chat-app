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
        let viewModel = ChatViewModel(delegate: self)
        let vc = ChatsViewController.instantiate(withStoryboardName: "Main")
        vc.viewModel = viewModel
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    
    deinit {
        print("deinit")
    }
}

extension ChatCoordinator: ContactsViewModelCoordinatorDelegate {
    func openChat() {
        
    }
}

extension ChatCoordinator: ChatViewModelCoordinatorDelegate {
    func openContacts() {
        let viewModel = ContactsViewModel(delegate: self)
        let vc = ContactsViewController.instantiate(withStoryboardName: "Main")
        vc.viewModel = viewModel
        self.navigationController.present(vc, animated: true, completion: nil)
    }
}
