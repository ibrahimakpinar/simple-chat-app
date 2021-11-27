//
//  CountryCodeTableViewCell.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 26.11.2021.
//

import UIKit
import SimpleChatAppAPI

class CountryCodeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgCountry: UIImageView!
    @IBOutlet weak var lblCountryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpView(with countryCodeItem: CountryCode) {
        imgCountry.image = UIImage.init(named: countryCodeItem.code.lowercased())
        lblCountryName.text = countryCodeItem.name
    }
}
