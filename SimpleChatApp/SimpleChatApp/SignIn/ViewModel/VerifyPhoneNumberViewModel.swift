//
//  VerifyPhoneNumberViewModel.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 17.11.2021.
//

import Foundation
import SimpleChatAppAPI

protocol VerifyPhoneNumberCoordinatorDelegate {
    func dismiss()
    func openCountryCodeListView(_ self: VerifyPhoneNumberViewController)
}

protocol VerifyPhoneNumberViewModelProtocol {
    func getTitle() -> String
    func didCountryCodeSelect(countryCode: CountryCode)
}

final class VerifyPhoneNumberViewModel: VerifyPhoneNumberViewModelProtocol {
    func didCountryCodeSelect(countryCode: CountryCode) {
        
    }
    
    private var coordinatorDelegate: VerifyPhoneNumberCoordinatorDelegate?
    
    init(delegate: VerifyPhoneNumberCoordinatorDelegate) {
        self.coordinatorDelegate = delegate
    }
    
    func getTitle() -> String {
        return "Verify your phone number"
    }
    
    func openCountryCodeListView(_ vcSelf: VerifyPhoneNumberViewController){
        coordinatorDelegate?.openCountryCodeListView(vcSelf)
    }
}
