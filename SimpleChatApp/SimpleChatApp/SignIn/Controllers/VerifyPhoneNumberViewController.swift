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
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var textCountryCode: UITextField!
    @IBOutlet weak var textPhoneNumber: UITextField!
    @IBOutlet weak var verifyButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var viewModel: VerifyPhoneNumberViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.isHidden = true
        self.cardView.layer.cornerRadius = 8.0
        self.cardView.clipsToBounds = true
        
        self.title = viewModel?.getTitle()
        self.verifyButton.isEnabled = false
        self.textCountryCode.addTarget(self, action: #selector(countryCodeOnTapped),
                                       for: .touchDown)
    }
    
    @IBAction func verifyButtonTapped(_ sender: Any) {
        guard let completeNumber = viewModel?.completeNumber else {
           return
        }
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        self.verifyButton.isEnabled = false;
        
        PhoneAuthProvider.provider()
          .verifyPhoneNumber(completeNumber, uiDelegate: nil) { verificationID, error in
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            
            if let error = error {
                print(error.localizedDescription)
                self.verifyButton.isEnabled = false
                //TODO: show error
            } else {
                self.viewModel?.openSMSVerificationView(phoneNumber: completeNumber)
                UserDefaults.standard.set(verificationID, forKey: "authVerificationID")
            }
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
    }
}
