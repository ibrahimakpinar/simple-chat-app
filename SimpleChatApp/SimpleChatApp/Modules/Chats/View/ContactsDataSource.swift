//
//  ContactsDataSource.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 17.12.2021.
//

import UIKit

final class ContactsDataSource: NSObject {
    typealias ContactDidSelectItemHandler = (Int) -> ()
    var didSelectItemHandler: ContactDidSelectItemHandler
    var contacts: [Contact] = []
    
    init(with contacts:[Contact], didSelectItemHandler: @escaping ContactDidSelectItemHandler) {
        self.contacts = contacts
        self.didSelectItemHandler = didSelectItemHandler
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
   
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectItemHandler(indexPath.row)
    }
}

extension ContactsDataSource: UITableViewDelegate {
    
}
