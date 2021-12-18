//
//  ContactListViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 17.12.2021.
//

import Foundation

protocol ContactsViewModelCoordinatorDelegate {
    func openChat()
}

protocol ContactsViewModelProtocol {
    func getDataSource() -> ContactsDataSource
}

class ContactsViewModel: ContactsViewModelProtocol {
    let contacts: [Contact] = []
    
    private var coordinatorDelegate: ContactsViewModelCoordinatorDelegate?
    
    init(delegate: ContactsViewModelCoordinatorDelegate) {
        self.coordinatorDelegate = delegate
    }
    
    func getTitle() -> String {
        return "Contacts"
    }
    
    func openChat() {
        coordinatorDelegate?.openChat()
    }
    
    func getDataSource() -> ContactsDataSource {
        return ContactsDataSource(with: self.contacts)
    }
    
}
