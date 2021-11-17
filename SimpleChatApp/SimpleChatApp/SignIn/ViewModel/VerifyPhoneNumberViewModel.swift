//
//  VerifyPhoneNumberViewModel.swift
//  SimpleChatApp
//
//  Created by PCMACEGITIM on 17.11.2021.
//

import Foundation

class VerifyPhoneNumberViewModel {
    let title: String
    var country: String?
    var countryCode: String?
    var phoneNumber: String?
    
    init() {
        self.title = "Verify your phone number"
    }
}
