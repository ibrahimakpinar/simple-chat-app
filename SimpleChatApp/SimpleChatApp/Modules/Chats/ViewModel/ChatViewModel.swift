//
//  ChatViewModel.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 8.12.2021.
//

import Foundation

protocol ChatViewModelCoordinatorDelegate {
    func openContacts()
}

class ChatViewModel {
    
    private var coordinatorDelegate: ChatViewModelCoordinatorDelegate?
   
    init(delegate: ChatViewModelCoordinatorDelegate) {
        self.coordinatorDelegate = delegate
    }
    
    func getTitle() -> String {
        return "Chats"
    }
    
    func openContacts() {
        self.coordinatorDelegate?.openContacts()
    }
}
