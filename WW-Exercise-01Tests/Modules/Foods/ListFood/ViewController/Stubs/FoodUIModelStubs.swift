//
//  FoodUIModelStubs.swift
//  WW-Exercise-01Tests
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation
@testable import WW_Exercise_01

enum FoodUIModelStubs {
    static func createFoodUIModel() -> FoodUIModel {
        FoodUIModel(title: "fish", imagePath: URLStubs.url.path)
    }
}
