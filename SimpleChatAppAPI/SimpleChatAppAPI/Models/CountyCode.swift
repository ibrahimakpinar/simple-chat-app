//
//  CountyCode.swift
//  SimpleChatAppAPI
//
//  Created by PCMACEGITIM on 18.11.2021.
//

import Foundation

public struct CountyCode: Codable{
    public enum CodingKeys: String, CodingKey {
        case code
        case name
    }
    
    let code: String
    let name: String
}
