//
//  SettingsViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 8.12.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    var viewModel: SettingsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel?.getTitle()
    }
}
