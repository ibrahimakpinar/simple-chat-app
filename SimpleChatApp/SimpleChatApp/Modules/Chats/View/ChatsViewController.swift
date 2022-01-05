//
//  ChatsViewController.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 8.12.2021.
//

import UIKit

class ChatsViewController: UIViewController, Storyboarded {
    var viewModel: ChatsViewModel?
    var chats: [MessageItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = false
        let user1 = MessageItem(message: "Let's talk about my new motocycle..", sender: "Hunter Wats", isIncoming: true, imageUrl: "men")
        
        let user2 = MessageItem(message: "Hi! can u see this pic..", sender: "Angela Li", isIncoming: true, imageUrl: "women")
        
        chats.append(user1)
        chats.append(user2)
        
        prepareUI()
    }
    
    //MARK : PrepareUI
    func prepareUI()  {
    
        self.title = viewModel?.getTitle()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(addTapped))
        
        self.navigationItem.rightBarButtonItem =
            UIBarButtonItem(image: UIImage(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(openContacts))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChatSummaryCell", bundle: nil), forCellReuseIdentifier: "ChatSummaryCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
        
    @objc
    func addTapped() {
        print("tap")
    }
    
    @objc
    func openContacts() {
        viewModel?.openContacts()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}


extension ChatsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatSummaryCell") as! ChatSummaryCell
        cell.setUp(with: chats[indexPath.row])
        return cell
    }
    
   
    
}
