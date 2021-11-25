//
//  VerifyPhoneNumberViewModel.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 17.11.2021.
//

import Foundation


protocol VerifyPhoneNumberCoordinatorDelegate {
    func dismiss()
    func openCountryCodeListView()
}

protocol VerifyPhoneNumberViewModelProtocol {
    func getTitle() -> String
}

final class VerifyPhoneNumberViewModel: VerifyPhoneNumberViewModelProtocol {
    private var coordinatorDelegate: VerifyPhoneNumberCoordinatorDelegate?
    
    init(delegate: VerifyPhoneNumberCoordinatorDelegate) {
        self.coordinatorDelegate = delegate
    }
    
    func getTitle() -> String {
        return "Verify your phone number"
    }
    
    func openCountryCodeListView(){
        coordinatorDelegate?.openCountryCodeListView()
    }
}
