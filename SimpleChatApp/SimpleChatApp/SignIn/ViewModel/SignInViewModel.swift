//
//  SignInViewModel.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 11.11.2021.
//

import Foundation

protocol SignInViewModelProtocol {
    func getTitle() -> String
    func getTermsAndConditions() -> String
    func getButtonTitle() -> String
}

class SignInViewModel: SignInViewModelProtocol {
    init() {}
    
    func getTitle() -> String {
        "Welcome To App"
    }
    
    func getTermsAndConditions() -> String {
        "Read our Privacy Policy. Tab Agree & Continue to accept to the terms of service"
    }
    
    func getButtonTitle() -> String {
        "AGREE & CONTINUE"
    }
}

