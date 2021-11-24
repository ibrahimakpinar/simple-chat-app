//
//  APIEndpoints.swift
//  SimpleChatAppAPI
//
//  Created by ibrahim akpinar on 19.11.2021.
//

import Foundation

public enum ApiEndPoints: String {
    case countries = "countries"
  
    public var urlString: String{
        self.rawValue
    }
}
