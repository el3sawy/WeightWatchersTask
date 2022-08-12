//
//  FoodRepositoryMock.swift
//  WW-Exercise-01Tests
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation
@testable import WW_Exercise_01

class FoodRepositoryMock {
    // MARK: - Testing Properties
    var completion: (Handler<[FoodModel]>)?
    
    // MARK: - Mock Behaviours
    func simulateSuccessResponse( ){
        let models = FoodStubs.createListFood()
        let successResponse = AppResponse.success(models)
        completion?(successResponse)
    }
    
    func simulateFailResponse() {
        let error = NetworkError.invalidURL
        let failResponse = AppResponse<[FoodModel]>.error(error)
        completion?(failResponse)
    }
    
    func simulateFailResponseWithNoInternet() {
        let error = NetworkError.noInternet
        let failResponse = AppResponse<[FoodModel]>.error(error)
        completion?(failResponse)
    }
}

// MARK: - Mock Function
extension FoodRepositoryMock: FoodRepositoryProtocol {
    func fetchFoods(completion: @escaping Handler<[FoodModel]>) {
        self.completion = completion
    }
}
