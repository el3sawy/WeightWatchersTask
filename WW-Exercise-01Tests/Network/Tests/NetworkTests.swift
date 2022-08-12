//
//  NetworkTests.swift
//  WW-Exercise-01Tests
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import XCTest
@testable import WW_Exercise_01

class NetworkTests: XCTestCase {
    
    // MARK: - Properties
    private var sut: Network!
    private var session: URLSession!
    
    override func setUpWithError() throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        session = URLSession(configuration: config)
        #if TESTING
        sut = Network(session: session)
        #endif
    }
    
    override func tearDownWithError() throws {
        sut = nil
        session = nil
        MockURLProtocol.responseError = nil
    }
    
    // MARK: - Request
    func test_request_success_returnListFoods() {
        // Given
        let expectation = self.expectation(description: "Fetch list foods model completed")
        MockURLProtocol.responseError = nil
        MockURLProtocol.simulateSuccessResponseWithValidData()
        
        // When
        sut.request(url: FoodRequest.listFood) { (response: AppResponse<[FoodModel]>) in
            // Then
            switch response {
            case .success(let value):
                XCTAssertEqual(value.count, 8, "Count must be 8 here")
            case .error(_):
                XCTFail("Error here must be success")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func test_Request_jsonCanNotDecode_fail() {
        // Given
        let expectation = self.expectation(description: "Fetch list foods model completed")
        MockURLProtocol.simulateSuccessResponseWithJsonCanNotDecode()
        // When
        sut.request(url: FoodRequest.listFood) { (response: AppResponse<[FoodModel]>) in
            // Then
            switch response {
            case .success(_):
                XCTFail("Error")
            case .error(let error):
                XCTAssertEqual(error, NetworkError.canNotDecode, "Can not decode json model")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func test_request_endPointNotFound_fail() {
        // Given
        let expectation = self.expectation(description: "Fetch list foods model completed")
        MockURLProtocol.simulateFailResponseEndPointNotFound()
        // When
        sut.request(url: FoodRequest.listFood) { (response: AppResponse<[FoodModel]>) in
            // Then
            switch response {
            case .success(_):
                XCTFail("Error")
            case .error(let error):
                XCTAssertNotNil(error.description, "Error in url not found")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func test_request_noInternetConnection_fail() {
        // Given
        let expectation = self.expectation(description: "Fetch list foods model completed")
        MockURLProtocol.responseError = NSError(domain: "", code: -1009, userInfo: nil)
        // When
        sut.request(url: FoodRequest.listFood) { (response: AppResponse<[FoodModel]>) in
            // Then
            switch response {
            case .success(_):
                XCTFail("Error")
            case .error(let error):
                XCTAssertEqual(error, NetworkError.noInternet, "There is error for offline connection")
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func test_request_notValidURL_fail(){
        sut.request(url: MockRequest.invalidURL) { (response: AppResponse<[FoodModel]>) in
            switch response {
            case .success(_):
                XCTFail("Error")
            case .error(let error):
                XCTAssertEqual(error, NetworkError.invalidURL, "There is error for offline connection")
            }
        }
    }
}
