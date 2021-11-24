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
}

protocol VerifyPhoneNumberViewModelProtocol {
    func load()
    func getTitle() -> String
}

final class VerifyPhoneNumberViewModel: VerifyPhoneNumberViewModelProtocol {
    var apiClient: CountryCodeServiceProtocol!
    var coordinatorDelegate: VerifyPhoneNumberCoordinatorDelegate?
    
    init(apiClient: CountryCodeServiceProtocol) {
        self.apiClient = apiClient
    }
    
    func getTitle() -> String {
        return "Verify your phone number"
    }
    
    func load() {
        self.apiClient.fetchCountryCodes { [weak self] (result) in
            switch result {
            case .success(let response):
                print(response.countries)
            case .failure(let error):
               print(error)
            }
        }
    }
}
