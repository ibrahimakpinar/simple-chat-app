//
//  UITableViewCell+Extensions.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 26.11.2021.
//

import UIKit

extension UITableViewCell {
    
    public class var identifier: String {
        return String(describing: self)
    }
}
