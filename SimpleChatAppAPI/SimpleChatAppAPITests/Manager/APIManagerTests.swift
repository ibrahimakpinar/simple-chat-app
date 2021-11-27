//
//  APIManagerTests.swift
//  SimpleChatAppAPITests
//
//  Created by ibrahim akpinar on 20.11.2021.
//

import XCTest
@testable import SimpleChatAppAPI
class APIManagerTests: XCTestCase {

    func test_apiManager_loadJSON_succes() throws {
        var completionCalled = false
        let apiManager = APIManager()
        
        try apiManager.fetchLocalJSONData(with: ApiEndPoints.Countries.urlString) {(_ result: Result<CountryCodesResponse, Error>) in
            completionCalled = true
        }
        
        XCTAssertTrue(completionCalled)
    }
}
