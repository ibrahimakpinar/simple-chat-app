//
//  APIManager.swift
//  SimpleChatAppAPI
//
//  Created by ibrahim akpinar on 19.11.2021.
//
import Foundation
import Combine


public protocol APIManagerProtocol {
    typealias CompletionHandler = ( _ data: Data?, _ error: Error?) -> Void
    func fetchLocalJSONData<T: Decodable>(with endPoint: String, completion: @escaping (Result<T, Error>) -> Void)
}

public class APIManager: APIManagerProtocol {
    public init() {}
    private var subscribers = Set<AnyCancellable>()
    
    public func fetchLocalJSONData<T>(with endPoint: String, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        let bundle = Bundle(for: type(of: self))
        let decoder = JSONDecoder()
        
        do {
            let url = try bundle.url(forResource: endPoint, withExtension: "json").unwrap()
            let data = try Data(contentsOf: url)
            let countries = try decoder.decode(T.self, from: data)
        
            completion(.success(countries))
        } catch {
            completion(.failure(error))
        }
    }
}
