//
//  SignInCoordinator.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 11.11.2021.
//

import UIKit
import Foundation
import SimpleChatAppAPI

protocol SignInCoordinatorDelegate : class{
    func dismiss()
}

class SignInCoordinator: Coordinator {
    weak var coordinatorDelegate: SignInCoordinatorDelegate?
    weak var parentCoordinator: AppCoordinator?
    
    var apiManager: APIManager?
    let apiClient: CountryCodeServiceProtocol!
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.apiManager  = APIManager()
        self.apiClient = CountryCodeService(apiManager: self.apiManager as! APIManagerProtocol)
    }
    
    func start() {
        let vc = SignInViewController.instantiate(withStoryboardName: "SignIn")
        vc.viewModel = SignInViewModel()
        vc.delegate = self
        self.navigationController.navigationBar.tintColor = #colorLiteral(red: 0, green: 0.8089314699, blue: 0.443246007, alpha: 1)
        self.navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.8089314699, blue: 0.443246007, alpha: 1)]
        self.navigationController.pushViewController(vc, animated: true)
    }
    
}

extension SignInCoordinator: SignInCoordinatorViewModelDelegate {
    func openVerifyPhoneNumberView() {
        let vc = VerifyPhoneNumberViewController.instantiate(withStoryboardName: "SignIn")
        let viewModel = VerifyPhoneNumberViewModel(delegate: self)
        vc.viewModel = viewModel
        
        self.navigationController.setNavigationBarHidden(false, animated: true)
        self.navigationController.pushViewController(vc, animated: true)
    }
}

extension SignInCoordinator: VerifyPhoneNumberCoordinatorDelegate {
    
    func openSMSVerificationView(withPhoneNumber: String) {
        let vc = SMSVerificationViewController.instantiate(withStoryboardName: "SignIn")
        let viewModel =  SMSVerificationViewModel(withPhoneNumber: withPhoneNumber)
        viewModel.coordinatorDelegate = self
        vc.viewModel = viewModel
        
        self.navigationController.setNavigationBarHidden(false, animated: true)
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func openCountryCodeListView(withSelf vcSelf: VerifyPhoneNumberViewController) {
        let vc = CountryCodeListViewController.instantiate(withStoryboardName: "SignIn")
        
        let viewModel = CountryCodeListViewModel(apiClient:  self.apiClient)
        viewModel.coordinatorDelegate = vcSelf
        vc.viewModel = viewModel
        
        self.navigationController.setNavigationBarHidden(false, animated: true)
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func dismiss() {
       
    }

}

// MARK: User auhtenticated with phone number
extension SignInCoordinator: SMSVerificationViewModelCoordinatorDelegate {
    func userDidSigned() {
        parentCoordinator?.childCoordinators.removeLast()
        parentCoordinator?.openMainFlow()
    }
}
