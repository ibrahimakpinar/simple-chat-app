//
//  Coordinator.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 16.11.2021.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinator : [Coordinator] {get set}
    var navigationController: UINavigationController { get set }
    func start()
}
