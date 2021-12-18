//
//  SMSVerifyViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 1.12.2021.
//

import UIKit
import FirebaseAuth

class SMSVerificationViewController: UIViewController, Storyboarded {
    var viewModel: SMSVerificationViewModel?
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var firstDigit: UITextField!
    @IBOutlet weak var secondDigit: UITextField!
    @IBOutlet weak var thirdDigit: UITextField!
    @IBOutlet weak var fourthDigit: UITextField!
    @IBOutlet weak var fifthDigit: UITextField!
    @IBOutlet weak var sixthDigit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblDescription.text = viewModel?.description
        cardView.layer.cornerRadius = 8.0
        cardView.clipsToBounds = true
        viewModel?.code = ""
        firstDigit.addBottomBorder()
        secondDigit.addBottomBorder()
        thirdDigit.addBottomBorder()
        fourthDigit.addBottomBorder()
        fifthDigit.addBottomBorder()
        sixthDigit.addBottomBorder()
        
        firstDigit.becomeFirstResponder()
    }
    
    @IBAction func digitEntered(_ sender: UITextField) {
        viewModel!.code?.append(sender.text!)
        if sender.tag == 6 {
            viewModel?.auth()
        }
        
        if let nextDigitTextField = self.view.viewWithTag(sender.tag + 1) {
            nextDigitTextField.becomeFirstResponder()
        }
    }
    
}
