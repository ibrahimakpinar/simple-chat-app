//
//  ContactItemCell.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 17.12.2021.
//

import UIKit

class ContactItemCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    @IBOutlet weak var contactImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(with contact:Contact) {
        self.name.text = contact.name
        self.phoneNumber.text = contact.phoneNumber
        
        self.contactImage.image = UIImage(named: contact.imageUrl)
        contactImage.layer.borderWidth = 1
        contactImage.layer.masksToBounds = false
        contactImage.layer.borderColor = UIColor.black.cgColor
        contactImage.layer.cornerRadius = contactImage.frame.height/2
        contactImage.clipsToBounds = true
    }
    
}
