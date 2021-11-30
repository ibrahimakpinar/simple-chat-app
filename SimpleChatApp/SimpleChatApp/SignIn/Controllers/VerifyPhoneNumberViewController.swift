//
//  VerifyPhoneNumberViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 17.11.2021.
//

import UIKit
import SimpleChatAppAPI
import Firebase
// Swift
import FirebasePhoneAuthUI

class VerifyPhoneNumberViewController: UIViewController, Storyboarded, FUIAuthDelegate {
    @IBOutlet weak var textCountryCode: UITextField!
    @IBOutlet weak var textPhoneNumber: UITextField!
    @IBOutlet weak var verifyButton: UIButton!
    var viewModel: VerifyPhoneNumberViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel?.getTitle()
        self.verifyButton.isEnabled = false
        self.textCountryCode.addTarget(self, action: #selector(countryCodeOnTapped),
                                       for: .touchDown)
    }
    
    @IBAction func verifyButtonTapped(_ sender: Any) {
        
        guard let completeNumber = viewModel?.completeNumber else {
           return
        }
        
        PhoneAuthProvider.provider()
          .verifyPhoneNumber(completeNumber, uiDelegate: nil) { verificationID, error in
              if let error = error {
                print(error.localizedDescription)
                return
              }
            
              UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
        }
    }
    
    
    @objc func countryCodeOnTapped(_ sender: Any) {
        viewModel?.openCountryCodeListView(withSelf: self)
    }
    
    @IBAction func phoneNumberEditingChanged(_ sender: Any) {
        if let textField = sender as? UITextField {
            viewModel?.phoneNumber = textField.text
            
            if viewModel?.completeNumber != nil {
                self.verifyButton.isEnabled = true
            }
        }
    }
    
}


//MARK: CountryCodeListView Extensions
extension VerifyPhoneNumberViewController: CountryCodeListCoordinatorDelegate {
    func didSelect(countryCode: CountryCode) {
        self.navigationController?.popViewController(animated: true)
        self.textCountryCode.text = "\(countryCode.dialCode) (\(countryCode.name))"
        self.viewModel?.dialCode = countryCode.dialCode
        /*
        FUIAuth.defaultAuthUI()?.delegate = self
        let phoneProvider = FUIPhoneAuth.init(authUI: FUIAuth.defaultAuthUI()!)
        FUIAuth.defaultAuthUI()?.providers = [phoneProvider]
        phoneProvider.signIn(withPresenting: self, phoneNumber: nil)
        */
    }
}
