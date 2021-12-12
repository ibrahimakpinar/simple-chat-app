//
//  ChatViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 8.12.2021.
//

import UIKit

class ChatViewController: UIViewController, Storyboarded {
    var viewModel: ChatViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = viewModel?.getTitle()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(addTapped))
        
        self.navigationItem.rightBarButtonItem =
            UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(addTapped))
        //self.tabBarController?.navigationController?.navigationBar.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
        
    @objc
    func addTapped() {
        print("tap")
    }
}


extension ChatViewController: UINavigationControllerDelegate {
    
}
