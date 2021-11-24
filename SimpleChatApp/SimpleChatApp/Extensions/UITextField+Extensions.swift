//
//  UITextField+Extensions.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 25.11.2021.
//

import UIKit

extension UITextField {
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = #colorLiteral(red: 0, green: 0.8089314699, blue: 0.443246007, alpha: 1)
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
