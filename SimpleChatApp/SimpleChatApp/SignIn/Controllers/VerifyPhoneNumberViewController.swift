//
//  VerifyPhoneNumberViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 17.11.2021.
//

import UIKit

class VerifyPhoneNumberViewController: UIViewController, Storyboarded {
    @IBOutlet weak var lblCountryCode: UITextField!
    @IBOutlet weak var lblPhoneNumber: UITextField!
    var viewModel: VerifyPhoneNumberViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel?.getTitle()
        viewModel?.load()
        self.lblCountryCode.addBottomBorder()
        self.lblPhoneNumber.addBottomBorder()
    }
}
