//
//  APIEndpoints.swift
//  SimpleChatAppAPI
//
//  Created by ibrahim akpinar on 19.11.2021.
//

import Foundation

public enum ApiEndPoints: String {
    case Countries = "Countries"
  
    public var urlString: String{
        self.rawValue
    }
}
