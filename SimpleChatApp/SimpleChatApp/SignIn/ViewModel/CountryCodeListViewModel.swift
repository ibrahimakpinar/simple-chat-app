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
    private var apiClient: CountryCodeServiceProtocol!
    var countries: [CountryCode]?
    var filteredCountries: [CountryCode]?
  
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
                self?.countries  = response.countries
            case .failure(let error):
               print(error)
            }
        }
    }
    
    func filter(searchText: String) {
        self.filteredCountries = self.countries?.filter {(countryCode: CountryCode) -> Bool in
            return countryCode.name.lowercased().contains(searchText.lowercased())
        }
    }
}
