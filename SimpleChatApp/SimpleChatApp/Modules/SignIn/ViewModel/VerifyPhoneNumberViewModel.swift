//
//  VerifyPhoneNumberViewModel.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 17.11.2021.
//

import Foundation
import SimpleChatAppAPI

protocol VerifyPhoneNumberCoordinatorDelegate {
    func dismiss()
    func openCountryCodeListView(withSelf self: VerifyPhoneNumberViewController)
    func openSMSVerificationView(withPhoneNumber: String)
}

protocol VerifyPhoneNumberViewModelProtocol {
    func getTitle() -> String
}

final class VerifyPhoneNumberViewModel: VerifyPhoneNumberViewModelProtocol {
    var dialCode: String?
    var phoneNumber: String?
    
    var completeNumber: String? {
        let number = "\(String(describing: dialCode ?? ""))\(String(describing: phoneNumber ?? ""))"
        return number.isValidPhoneNumber() ? number : nil
    }
    
    private var coordinatorDelegate: VerifyPhoneNumberCoordinatorDelegate?
    
    init(delegate: VerifyPhoneNumberCoordinatorDelegate) {
        self.coordinatorDelegate = delegate
    }
    
    func getTitle() -> String {
        return "Verify your phone number"
    }
    
    func openCountryCodeListView(withSelf vcSelf: VerifyPhoneNumberViewController){
        coordinatorDelegate?.openCountryCodeListView(withSelf: vcSelf)
    }
    
    func openSMSVerificationView(phoneNumber: String) {
        coordinatorDelegate?.openSMSVerificationView(withPhoneNumber: phoneNumber)
    }
}

extension String {
    func isValidPhoneNumber() -> Bool {
        let regEx = "^\\+(?:[0-9] ?){6,14}[0-9]$"
        let phoneCheck = NSPredicate(format: "SELF MATCHES[c] %@", regEx)
        return phoneCheck.evaluate(with: self)
    }
}
