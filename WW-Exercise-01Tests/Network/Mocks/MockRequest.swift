//
//  MockRequest.swift
//  WW-Exercise-01Tests
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation
@testable import WW_Exercise_01

enum MockRequest: BaseURLRequest {
    case invalidURL
    
    var method: HTTPMethod {
        switch self {
        case .invalidURL:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .invalidURL:
            return ""
        }
    }
    
    func urlRequest() -> URLRequest? {
        switch self {
        case .invalidURL:
            return nil
        }
    }
    
    
}
