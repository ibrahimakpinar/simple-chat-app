//
//  SignInViewModel.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 11.11.2021.
//

import Foundation
class SignInViewModel {
    let title: String
    let termsAndConditions: String
    let buttonTitle: String
    init() {
        self.title = "Welcome To App"
        self.termsAndConditions = "Read our Privacy Policy. Tab Agree & Continue to accept to the terms of service"
        self.buttonTitle = "AGREE & CONTINUE"
    }
}

