//
//  CallsViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 8.12.2021.
//

import UIKit

class CallsViewController: UIViewController, Storyboarded {
    var viewModel: CallsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel?.getTitle()
    }
}
