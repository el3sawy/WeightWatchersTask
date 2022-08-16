//
//  JosnParser.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation

protocol JsonParserProtocol {
    func parse<T: Codable>(data: Data)-> AppResponse<T>
}

struct JsonParser: JsonParserProtocol {
    func parse<T: Codable>(data: Data)-> AppResponse<T> {
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return .success(model)
        } catch {
            return .error(.canNotDecode)
        }
    }
}
