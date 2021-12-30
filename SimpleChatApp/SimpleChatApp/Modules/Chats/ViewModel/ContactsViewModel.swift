//
//  ContactListViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 17.12.2021.
//

import Foundation
import Contacts
import UIKit

protocol ContactsViewModelCoordinatorDelegate {
    func openChat()
}

protocol ContactsViewModelProtocol {
    func getDataSource() -> ContactsDataSource
}

class ContactsViewModel: ContactsViewModelProtocol {
    var contacts: [Contact] = []
    
    private var coordinatorDelegate: ContactsViewModelCoordinatorDelegate?
    
    init(delegate: ContactsViewModelCoordinatorDelegate) {
        self.coordinatorDelegate = delegate
        self.contacts = getContacts()
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
    
    fileprivate func getContacts()-> [Contact] {
        let store = CNContactStore()
        var contacts = [CNContact]()
        let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        do {
            let fetchRequest = CNContactFetchRequest( keysToFetch: keysToFetch)
            try store.enumerateContacts(with: fetchRequest) {(contact, stop) -> Void in
                contacts.append(contact)
            }
           
        } catch {
            print("Failed to fetch contact, error: \(error)")
        }
        
        var appContacts = [Contact]()
        
        for item in contacts {
            let contact = Contact(name: ("\(item.givenName) \(item.familyName)" ), phoneNumber: (item.phoneNumbers.first?.value.stringValue)!, imageUrl:item.givenName, about: "")
            
            appContacts.append(contact)
        }
        
        return appContacts
    }
    
}
