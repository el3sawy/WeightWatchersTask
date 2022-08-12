//
//  UserStubs.swift
//  WW-Exercise-01Tests
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation
@testable import WW_Exercise_01

enum FoodStubs {
    static func createListFood() -> [FoodModel] {
        let data = getJSON(bundle: Bundle.testBundle, for: "food_list_model")
        let foods = parse(jsonData: data)
        return foods
    }
    
    static func getListFoodData() -> Data? {
        let jsonData = try? JSONEncoder().encode(createListFood())
        return jsonData
    }
    
    private static func parse(jsonData: Data) -> [FoodModel] {
        do {
            let decodedData = try JSONDecoder().decode([FoodModel].self, from: jsonData)
           return decodedData
        } catch {
            print("decode error")
        }
        return []
    }
}
