//
//  ChatViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 13.12.2021.
//

import UIKit

class ChatViewController: UIViewController, Storyboarded {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
    }
}
