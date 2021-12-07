//
//  VerifyPhoneNumberViewModelTests.swift
//  SimpleChatAppTests
//
//  Created by ibrahim akpinar on 5.12.2021.
//

import XCTest
@testable import SimpleChatApp
class VerifyPhoneNumberViewModelTests: XCTestCase {

    private var viewModel: VerifyPhoneNumberViewModel!
    
    override func setUp() {
        let delegate = MockCoordinatorDelegate()
        viewModel = VerifyPhoneNumberViewModel(delegate: delegate)
    }
    
    func test_completeNumber() {
        viewModel.dialCode = "+90"
        viewModel.phoneNumber = "5554443322"
        
        XCTAssertEqual(viewModel.completeNumber, "+905554443322")
    }
}

private class MockCoordinatorDelegate: VerifyPhoneNumberCoordinatorDelegate {
    func dismiss() {
        
    }
    
    func openCountryCodeListView(withSelf self: VerifyPhoneNumberViewController) {
        
    }
    
    func openSMSVerificationView(withPhoneNumber: String) {
        
    }
    
    
}
