//
//  ChatViewModel.swift
//  SimpleChatApp
//
//  Created by ibrahim AKPINAR on 1.01.2022.
//

import Foundation

protocol ChatViewModelCoordinatorDelegate {

}

class ChatViewModel {
    
    private var coordinatorDelegate: ChatViewModelCoordinatorDelegate?
   
    init(delegate: ChatViewModelCoordinatorDelegate) {
        self.coordinatorDelegate = delegate
    }
    
    func getTitle() -> String {
        return "Chat"
    }
}
