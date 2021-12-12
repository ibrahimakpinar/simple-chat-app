//
//  MainCoordinator.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 16.11.2021.
//

import UIKit
import Foundation


protocol MainTabBarCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get set }
    
    func selectPage(_ page: TabBarPage)
    
    func setSelectedIndex(_ index: Int)
    
    func currentPage() -> TabBarPage?
}


class TabBarCoordinator: NSObject, Coordinator {
    weak var parentCoordinator: AppCoordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let tabBarController = TabBarController()
               tabBarController.coordinator = self
        
        // MARK: Chats
        let chatsNavigationController = UINavigationController()
        let chatImage = UIImage(systemName: "bubble.left.and.bubble.right.fill")
        chatsNavigationController.tabBarItem = UITabBarItem(title: "Chats", image: chatImage, tag: 0)
        let chatsCoordinator = ChatCoordinator(navigationController: chatsNavigationController)
        chatsCoordinator.start()
        
        // MARK: Calls
        let callsNavigationController = UINavigationController()
        let phoneImage = UIImage(systemName: "phone.bubble.left.fill")
        callsNavigationController.tabBarItem = UITabBarItem(title: "Calls", image: phoneImage, tag: 1)
        let callsCoordinator = CallsCoordiantor(navigationController: callsNavigationController)
        callsCoordinator.start()
        
        
        tabBarController.viewControllers = [chatsNavigationController, callsNavigationController]
        
        tabBarController.modalPresentationStyle = .fullScreen
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.viewControllers = [tabBarController]
       
                
    }
}
