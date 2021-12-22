//
//  ContactsDataSource.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 17.12.2021.
//

import UIKit

final class ContactsDataSource: NSObject {
    var contacts: [Contact] = []
    
    init(with contacts:[Contact]) {
        self.contacts = contacts
    }
}

extension ContactsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactItemCell", for: indexPath) as! ContactItemCell
        
        let contact = contacts[indexPath.row]
        cell.setup(with: contact)
        
        return cell
    }
}

extension ContactsDataSource: UITableViewDelegate {
    
}
