//
//  CountyCodeService.swift
//  SimpleChatAppAPI
//
//  Created by ibrahim akpinar on 18.11.2021.
//

import Foundation

public protocol CountryCodeServiceProtocol {
    func fetchCountryCodes(completion: @escaping (Result<CountryCodesResponse,Error>) -> Void)
}


public class CountryCodeService : CountryCodeServiceProtocol {
    public var apiManager: APIManagerProtocol
    
    public init(apiManager: APIManagerProtocol) {
        self.apiManager = apiManager
    }
    
    public func fetchCountryCodes(completion: @escaping (Result<CountryCodesResponse, Error>) -> Void) {
         apiManager.fetchLocalJSONData(with: ApiEndPoints.Countries.urlString) {(response: Result<CountryCodesResponse, Error>)  in
             switch response {
             case .success(let response):
                completion(.success(response))
             case .failure(let error):
                print(error)
                completion(.failure(APIError.invalidResponse))
             }
          }
     }
}
