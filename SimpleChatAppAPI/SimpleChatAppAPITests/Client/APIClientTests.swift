//
//  APIClientTests.swift
//  SimpleChatAppAPITests
//
//  Created by ibrahim akpinar on 20.11.2021.
//

import XCTest
@testable import SimpleChatAppAPI
class APIClientTests: XCTestCase {

    func test_response_parse() throws {
        let bundle = Bundle(for: type(of: self))
        let url = try bundle.url(forResource: "countryList", withExtension: "json").unwrap()
        let data = try Data(contentsOf: url)
        let response = try JSONDecoder().decode(CountryCodesResponse.self, from: data)
        let countries = response.countries
        
        XCTAssertEqual(countries[0].code,"+90")
        XCTAssertEqual(countries[0].name,"Turkey")
    }
    
    func test_countryCodeService_called() {
        var completionHandlerCalled = false
        let client = CountryCodeService(apiManager: APIManager())
        
        client.fetchCountryCodes { (_) in
            completionHandlerCalled = true
        }
        
        XCTAssertTrue(completionHandlerCalled)
    }
}
