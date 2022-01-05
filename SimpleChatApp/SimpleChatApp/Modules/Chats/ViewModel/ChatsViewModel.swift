//
//  ChatViewModel.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 8.12.2021.
//

import Foundation

protocol ChatsViewModelCoordinatorDelegate {
    func openContacts()
}

class ChatsViewModel {
    
    private var coordinatorDelegate: ChatsViewModelCoordinatorDelegate?
   
    init(delegate: ChatsViewModelCoordinatorDelegate) {
        self.coordinatorDelegate = delegate
    }
    
    func getTitle() -> String {
        return "Chats"
    }
    
    func openContacts() {
        self.coordinatorDelegate?.openContacts()
    }
}
