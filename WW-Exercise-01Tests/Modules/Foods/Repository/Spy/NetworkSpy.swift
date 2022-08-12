//
//  NetworkSpy.swift
//  WW-Exercise-01Tests
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation
@testable import WW_Exercise_01

class NetworkSpy {
    
    // MARK: - Testing Properties
    var isRequestCalled = false
}

// MARK: - Spy Functions
extension NetworkSpy: NetworkProtocol {
    func request<T>(url: BaseURLRequest, completionHandler: @escaping Handler<T>) where T : Decodable, T : Encodable {
        isRequestCalled.toggle()
    }
}
