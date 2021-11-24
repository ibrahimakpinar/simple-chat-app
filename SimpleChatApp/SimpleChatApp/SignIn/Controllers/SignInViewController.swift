//
//  SignInViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 13.11.2021.
//

import UIKit
import SimpleChatAppAPI

enum LinkType: String {
        case termsAndConditions
        case privacyPolicy
}

protocol SignInCoordinatorViewModelDelegate: class {
    func openVerifyPhoneNumberView()
}

class SignInViewController: UIViewController, Storyboarded {
 
    var viewModel: SignInViewModel?
    var delegate: SignInCoordinatorViewModelDelegate!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var textTermsOfService: UITextView!
    @IBOutlet weak var btnAgreeAndContinue: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard viewModel != nil else {
            fatalError("ohh boy! view model cannot be nil!")
        }
        self.lblTitle.text = viewModel?.getTitle()
        self.textTermsOfService.hyperLink(originalText: viewModel!.getTermsAndConditions(), linkTextsAndTypes: ["terms of service": LinkType.termsAndConditions.rawValue,"Privacy Policy": LinkType.privacyPolicy.rawValue])
        
        self.btnAgreeAndContinue.setTitle(viewModel?.getButtonTitle(),for: UIControl.State.normal)
    }
    
    @IBAction func agreeAndContinueTapped(_ sender: Any) {
        delegate?.openVerifyPhoneNumberView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}

// MARK: - UITextViewDelegate
extension SignInViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        if let linkType = LinkType(rawValue: URL.absoluteString) {
            // TODO: handle linktype here with switch or similar.
        }
        return false
    }
}
