//
//  ContactsViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 17.12.2021.
//

import UIKit

class ContactsViewController: UIViewController, Storyboarded {

    @IBOutlet weak var tableView: UITableView!
    private(set) var dataSource: ContactsDataSource?
    
    var viewModel: ContactsViewModelProtocol!
       
    override func viewDidLoad() {
        dataSource = viewModel.getDataSource()
        self.tableView.delegate = dataSource
        self.tableView.dataSource = dataSource
        registerCells()
        super.viewDidLoad()
    }
    
    // MARK: UI
      
      private func registerCells() {
          tableView.register(UINib(nibName: "ContactItemCell", bundle: nil), forCellReuseIdentifier: "ContactItemCell")
      }
}
