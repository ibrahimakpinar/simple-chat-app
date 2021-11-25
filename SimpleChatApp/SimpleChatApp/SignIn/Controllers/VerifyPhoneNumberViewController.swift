//
//  VerifyPhoneNumberViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 17.11.2021.
//

import UIKit

class VerifyPhoneNumberViewController: UIViewController, Storyboarded {
    @IBOutlet weak var textCountryCode: UITextField!
    @IBOutlet weak var textPhoneNumber: UITextField!
    var viewModel: VerifyPhoneNumberViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel?.getTitle()
        self.textCountryCode.addBottomBorder()
        self.textPhoneNumber.addBottomBorder()
        
        self.textCountryCode.addTarget(self, action: #selector(countryCodeOnTapped), for: .touchDown)
    }
    
    @objc func countryCodeOnTapped(_ sender: Any) {
        viewModel?.openCountryCodeListView()
    }
}
