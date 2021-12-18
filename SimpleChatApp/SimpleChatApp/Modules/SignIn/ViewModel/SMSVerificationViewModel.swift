//
//  SMSVerifyViewModel.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 1.12.2021.
//

import Foundation
import FirebaseAuth


protocol SMSVerificationViewModelCoordinatorDelegate {
    func userDidSigned()
}

final class SMSVerificationViewModel {
    let phoneNumber: String
    var code: String?
    var coordinatorDelegate: SMSVerificationViewModelCoordinatorDelegate?
    
    var description: String? {
        return "Enter the 6-digit code we sent to \n\(phoneNumber) "
    }
    
    init(withPhoneNumber phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }
    
    func auth() {
        
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: UserDefaults.standard.string(forKey: "authVerificationID")!,
            verificationCode: code!
        )
        
        Auth.auth().signIn(with: credential) { [self] authResult, error in
            if let error = error {
                print(error)
                return
            }
            coordinatorDelegate?.userDidSigned()
        }
    }
}
