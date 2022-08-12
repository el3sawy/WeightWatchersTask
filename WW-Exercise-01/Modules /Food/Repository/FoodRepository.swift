//
//  FoodRepository.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation

protocol FoodRepositoryProtocol {
    func fetchFoods(completion: @escaping Handler<[FoodModel]>)
}

class FoodRepository {
    // MARK: - Properties
    private let network: NetworkProtocol
    
    // MARK: - Init
    init(network: NetworkProtocol) {
        self.network = network
    }
}

extension FoodRepository: FoodRepositoryProtocol {
    func fetchFoods(completion: @escaping Handler<[FoodModel]>) {
        network.request(url: FoodRequest.listFood, completionHandler: completion)
    }
}
