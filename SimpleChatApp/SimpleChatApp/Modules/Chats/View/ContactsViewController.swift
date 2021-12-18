//
//  ContactsViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 17.12.2021.
//

import UIKit

class ContactsViewController: UIViewController, Storyboarded {

    private(set) var dataSource: ContactsDataSource?
    
    var viewModel: ContactsViewModelProtocol!
       
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
