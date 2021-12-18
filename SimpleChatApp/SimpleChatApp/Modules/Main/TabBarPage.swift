//
//  TabBarPage.swift
//  SimpleChatApp
//
//  Created by ibrahim akpinar on 12.12.2021.
//

import Foundation

enum TabBarPage {
    case chats
    case calls
    case camera
    case settings

    init?(index: Int) {
        switch index {
        case 0:
            self = .chats
        case 1:
            self = .calls
        case 2:
            self = .camera
        case 3:
            self = .settings
        default:
            return nil
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .chats:
            return 0
        case .calls:
            return 1
        case .camera:
            return 2
        case .settings:
            return 3
        }
    }
}
