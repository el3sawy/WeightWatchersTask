//
//  FoodRequestTest.swift
//  WW-Exercise-01Tests
//
//  Created by Ahmed Elesawy on 02/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import XCTest
@testable import WW_Exercise_01

class FoodRequestTest: XCTestCase {
    
    func test_listFoods() {
        // When
        let listFoods = FoodRequest.listFood
        let path = listFoods.path
        let method = listFoods.method
        // Then
        XCTAssertEqual(path, "/assets/cmx/us/messages/collections.json", "Error in list food url path")
        XCTAssertEqual(method, .get, "HTTP method must be GET")
    }

}
