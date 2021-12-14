//
//  ChatSummaryCell.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 11.12.2021.
//

import UIKit

class ChatSummaryCell: UITableViewCell {


    @IBOutlet weak var senderName: UILabel!
    @IBOutlet weak var lastMessage: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        userImage.image = UIImage(named: "men")
        userImage.layer.borderWidth = 1
        userImage.layer.masksToBounds = false
        userImage.layer.borderColor = UIColor.black.cgColor
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(with model:MessageItem) {
        senderName.text = model.sender
        lastMessage.text = model.message
        userImage.image = UIImage(named: model.imageUrl!)
    }
    
}
