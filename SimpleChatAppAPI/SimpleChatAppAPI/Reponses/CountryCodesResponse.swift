//
//  CountryCodesResponse.swift
//  SimpleChatAppAPI
//
//  Created by PCMACEGITIM on 18.11.2021.
//
import Foundation

public struct CountryCodesResponse: Codable {
    public let results: [CountyCode]
}
