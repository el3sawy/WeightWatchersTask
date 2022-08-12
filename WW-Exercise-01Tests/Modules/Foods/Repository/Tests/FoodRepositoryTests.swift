//
//  FoodRepositoryTests.swift
//  WW-Exercise-01Tests
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import XCTest
@testable import WW_Exercise_01

class FoodRepositoryTests: XCTestCase {
    
    private var sut: FoodRepository!
    private var netWork: NetworkSpy!
    override func setUpWithError() throws {
        netWork = NetworkSpy()
        sut = FoodRepository(network: netWork)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_fetchFoods_isCalled_successfully() {
        // When
        sut.fetchFoods { _ in
            
        }
        // Then
        XCTAssertEqual(netWork.isRequestCalled, true, "Request func not called here")
    }
}
