//
//  Result.swift
//  SimpleChatAppAPI
//
//  Created by PCMACEGITIM on 18.11.2021.
//

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}
