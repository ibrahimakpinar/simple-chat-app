//
//  SignInViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 13.11.2021.
//

import UIKit

enum LinkType: String {
        case termsAndConditions
        case privacyPolicy
}

class SignInViewController: UIViewController, Storyboarded {
 
    var viewModel: SignInViewModel?
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var textTermsOfService: UITextView!
    @IBOutlet weak var btnAgreeAndContinue: UIButton!
    weak var coordinator: SignInCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard viewModel != nil else {
            fatalError("ohh boy! view model cannot be nil!")
        }
        self.lblTitle.text = viewModel?.title
        self.textTermsOfService.hyperLink(originalText: viewModel!.termsAndConditions, linkTextsAndTypes: ["terms of service": LinkType.termsAndConditions.rawValue,"Privacy Policy": LinkType.privacyPolicy.rawValue])
        
        self.btnAgreeAndContinue.setTitle(viewModel?.buttonTitle,for: UIControl.State.normal)
    }
    
    @IBAction func agreeAndContinueTapped(_ sender: Any) {
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
