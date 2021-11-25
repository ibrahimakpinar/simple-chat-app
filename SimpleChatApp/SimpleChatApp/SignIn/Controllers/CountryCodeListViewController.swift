//
//  CountryCodeListViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 26.11.2021.
//

import UIKit

class CountryCodeListViewController: UIViewController, Storyboarded {
    var viewModel: CountryCodeListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel?.getTitle()
    }
}
