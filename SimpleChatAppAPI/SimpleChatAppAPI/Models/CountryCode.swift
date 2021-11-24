//
//  CountyCode.swift
//  SimpleChatAppAPI
//
//  Created by ibrahim akpinar on 18.11.2021.
//

import Foundation

public struct CountryCode: Codable{

    var code: String? = ""
    var name: String? = ""
    
    public enum CodingKeys: String, CodingKey {
        case code
        case name
    }
}
