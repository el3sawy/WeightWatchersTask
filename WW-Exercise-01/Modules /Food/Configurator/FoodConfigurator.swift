//
//  File.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import UIKit

enum FoodConfiguratorType {
    case listFoods
}

enum FoodConfigurator {
    
    static func getViewController(with type: FoodConfiguratorType) -> UIViewController {
        switch type {
            
        case .listFoods:
            return configListFoodsViewController()
        }
    }
    
    private static func configListFoodsViewController() -> UIViewController {
        let network = Network.shared
        let repository = FoodRepository(network: network)
        let view = ListFoodViewController()
        let presenter = ListFoodPresenter(repository: repository, view: view)
        view.presenter = presenter
        return view
    }
}
