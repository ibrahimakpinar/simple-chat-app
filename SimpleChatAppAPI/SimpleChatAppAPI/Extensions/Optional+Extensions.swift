//
//  Optional+Extensions.swift
//  SimpleChatAppAPI
//
//  Created by ibrahim akpinar on 21.11.2021.
//

import Foundation

public extension Optional {
    
    struct FoundNilError: Error { }
    
    func unwrap() throws -> Wrapped {
        switch self {
        case .some(let wrapped):
            return wrapped
        case .none:
            throw FoundNilError()
        }
    }
}
