//
//  SignInViewModelTests.swift
//  SimpleChatAppTests
//
//  Created by ibrahim akpinar on 4.12.2021.
//

import XCTest
@testable import SimpleChatApp

class SignInViewModelTests: XCTestCase {

    private var viewModel: SignInViewModel!
    
    override func setUp() {
        viewModel = SignInViewModel()
    }
    
    func test_render_titles() {
        XCTAssertEqual(viewModel.getTitle(), "Welcome To App")
        XCTAssertEqual(viewModel.getTermsAndConditions(), "Read our Privacy Policy. Tab Agree & Continue to accept to the terms of service")
        XCTAssertEqual(viewModel.getButtonTitle(), "AGREE & CONTINUE")
    }

}
