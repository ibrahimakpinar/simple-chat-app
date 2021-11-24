//
//  APIError.swift
//  SimpleChatAppAPI
//
//  Created by ibrahim akpinar on 19.11.2021.
//

import Foundation

enum APIError: String, Error {
    case invalidURL = "Invalid URL"
    case invalidData = "Invalid Data"
    case invalidResponse = "Invalid Response"
}
