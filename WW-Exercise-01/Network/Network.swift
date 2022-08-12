//
//  Network.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation

typealias Handler<T> = (AppResponse<T>) -> Void

protocol NetworkProtocol {
    func request <T: Codable>(url: BaseURLRequest, completionHandler: @escaping Handler<T>)
}

class Network {
    
    // MARK: - Properties
    private var session: URLSession
    #if TESTING
    static var shared = Network()
    
    // MARK: - Init
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    #else
    static let shared = Network()
    private init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    #endif
}

extension Network: NetworkProtocol {
    
    func request <T: Codable>(url: BaseURLRequest, completionHandler: @escaping Handler<T>) {
        guard let request = url.urlRequest() else {
            return completionHandler(.error(.invalidURL))
        }
        
        session.dataTask(with: request) { data, _, error in
            
            if let responseError = error { // Response error
                let responseError = NetworkResponseError.filterError(error: responseError)
                    DispatchQueue.main.async { completionHandler(AppResponse.error(responseError))}
                
            } else if let responseData = data { // Success response
                let result: AppResponse<T> = JsonParser.handleJsonCoder(data: responseData)
                DispatchQueue.main.async { completionHandler(result) }
            }
        }.resume()
    }
    
    func fetch<T: Codable>(url: BaseURLRequest, responseType: T.Type = T.self) async -> AppResponse<T> {
        guard let request = url.urlRequest() else {
            return .error(.invalidURL)
        }
        
        return await withCheckedContinuation { continuation in
            session.dataTask(with: request) { data, _, error1 in
                if let responseError = error1 { // Response error
                    let responseError1 = NetworkResponseError.filterError(error: responseError)
                    DispatchQueue.main.async { continuation.resume(returning: AppResponse.error(responseError1))}
                    
                } else if let responseData = data { // Success response
                    let result: AppResponse<T> = JsonParser.handleJsonCoder(data: responseData)
                    DispatchQueue.main.async { continuation.resume(returning: result) }
                }
            }.resume()
        }
    }
}
