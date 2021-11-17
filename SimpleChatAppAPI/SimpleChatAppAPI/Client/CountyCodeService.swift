//
//  CountyCodeService.swift
//  SimpleChatAppAPI
//
//  Created by PCMACEGITIM on 18.11.2021.
//

import Foundation

protocol CountryCodeServiceProtocol {
    func fetchCountryCodes(completion: @escaping (Result<CountryCodesResponse>) -> Void)
}
