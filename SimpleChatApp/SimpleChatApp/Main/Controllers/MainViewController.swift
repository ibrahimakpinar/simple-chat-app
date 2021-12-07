//
//  MainViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 16.11.2021.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }

}
