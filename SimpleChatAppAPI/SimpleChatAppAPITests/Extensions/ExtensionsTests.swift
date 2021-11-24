//
//  ExtensionsTests.swift
//  SimpleChatAppAPITests
//
//  Created by ibrahim akpinar on 22.11.2021.
//

import XCTest

class ExtensionsTests: XCTestCase {

    func test_optional_extension_unwrapThrows() {
        let item: Int? = nil
        XCTAssertThrowsError(try item.unwrap())
    }
    
    func test_optional_extension_unwrapReturnsWrapped() {
        let item: Int? = 1
        XCTAssertEqual(try item.unwrap(), 1)
    }

}
