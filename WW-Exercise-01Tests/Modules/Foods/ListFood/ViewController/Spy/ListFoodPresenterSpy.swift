//
//  ListFoodPresenterSpy.swift
//  WW-Exercise-01Tests
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation
@testable import WW_Exercise_01

class ListFoodPresenterSpy {
    // MARK: - Testing Properties
    var isFetchFoodsCalled = false
}

// MARK: - Spy Functions
extension ListFoodPresenterSpy: ListFoodPresenterProtocol {
    func fetchFoods() {
        isFetchFoodsCalled.toggle()
    }
    
    func getFood(at index: Int) -> FoodUIModel {
        FoodUIModelStubs.createFoodUIModel()
    }
    
    var countFoods: Int {
        return 5
    }
}
