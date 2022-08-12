//
//  FoodConfiguratorTest.swift
//  WW-Exercise-01Tests
//
//  Created by Ahmed Elesawy on 02/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import XCTest
@testable import WW_Exercise_01

class FoodConfiguratorTest: XCTestCase {

    func test_listFoods() {
        // When
        let viewController = FoodConfigurator.getViewController(with: .listFoods) as? ListFoodViewController
        // Then
        XCTAssertNotNil(viewController?.presenter, "not set init for home presenter")
    }
}
