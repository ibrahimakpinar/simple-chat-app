//
//  CountyCode.swift
//  SimpleChatAppAPI
//
//  Created by ibrahim akpinar on 18.11.2021.
//

import Foundation

public struct CountryCode: Codable{
  
    public let code: String
    public let name: String
    public let dialCode: String
    public let flag: String
    
    public enum CodingKeys: String, CodingKey {
        case code
        case name
        case dialCode
        case flag
    }
}
