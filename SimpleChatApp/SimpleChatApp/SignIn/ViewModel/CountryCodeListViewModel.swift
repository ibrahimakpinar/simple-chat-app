//
//  CountryCodeListViewModel.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 26.11.2021.
//

import Foundation
import SimpleChatAppAPI

protocol CountryCodeListViewModelProtocol {
    func load()
    func getTitle() -> String
}

final class CountryCodeListViewModel: CountryCodeListViewModelProtocol {
    var apiClient: CountryCodeServiceProtocol!
  
    init(apiClient: CountryCodeServiceProtocol) {
        self.apiClient = apiClient
    }
    
    func getTitle() -> String {
        return "Choose Country Code"
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
