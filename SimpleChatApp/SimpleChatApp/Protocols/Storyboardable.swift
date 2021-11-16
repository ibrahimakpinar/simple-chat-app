//
//  Storyboardable.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 16.11.2021.
//

import UIKit

protocol Storyboarded {
    static var storyboardBundle: Bundle { get }
    static var storyboardIdentifier: String { get }
    static func instantiate(withStoryboardName: String) -> Self
    
}

extension Storyboarded where Self: UIViewController {
    static var storyboardBundle: Bundle { .main }
    static var storyboardIdentifier: String { String(describing: self) }
    
    static func instantiate(withStoryboardName: String) -> Self{
        guard let vc = UIStoryboard(name: withStoryboardName, bundle: storyboardBundle).instantiateViewController(identifier: storyboardIdentifier) as? Self else {
            fatalError("Unable to Instatiate View Controller With Storyboard Identifier \(storyboardIdentifier)")
        }
        
        return vc
    }
}
