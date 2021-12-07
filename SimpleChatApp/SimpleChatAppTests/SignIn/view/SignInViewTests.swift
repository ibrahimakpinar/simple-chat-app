//
//  SignInViewTests.swift
//  SimpleChatAppTests
//
//  Created by ibrahim akpinar on 4.12.2021.
//

import XCTest
@testable import SimpleChatApp

class SignInViewTests: XCTestCase {

    func test_view_load() {
        let viewModel = SignInViewModel()
        let viewController = SignInViewController.instantiate(withStoryboardName: "SignIn")
        viewController.viewModel = viewModel
        
        _ = viewController.view
        
        XCTAssertNotNil(viewController.lblTitle.text)
    }

}
