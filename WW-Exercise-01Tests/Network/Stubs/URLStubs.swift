//
//  URLStubs.swift
//  WW-Exercise-01Tests
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation

enum URLStubs {
    static var url: URL { URL(string: "//any.com/")! }
    static var urlRequest: URLRequest { URLRequest(url: url) }
}
