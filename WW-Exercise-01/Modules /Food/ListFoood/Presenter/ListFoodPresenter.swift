//
//  ListFoodPresenter.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation

protocol ListFoodPresenterProtocol {
    func fetchFoods()
    func getFood(at index: Int) -> FoodUIModel
    var countFoods: Int { get }
}

class ListFoodPresenter {
    // MARK: - Properties
    private let repository: FoodRepositoryProtocol
    private weak var view: ListFoodViewProtocol?
    private var foods: [FoodUIModel] = []
    
    // MARK: - Init
    init(
        repository: FoodRepositoryProtocol,
        view: ListFoodViewProtocol) {
            self.repository = repository
            self.view = view
        }
    
    // MARK: - Functions
    private func handleResponse(_ response:AppResponse<[FoodModel]>) {
        switch response {
            
        case .success(let value):
            self.foods = handleSuccessResponse(values: value)
            view?.reloadTableView()
        case .error(let error):
            handleError(error)
        }
    }
    
    private func handleSuccessResponse(values: [FoodModel]) -> [FoodUIModel] {
        values.map(map(_:))
    }
    
    private func map(_ item: FoodModel) -> FoodUIModel {
        .init(title: item.title, imagePath: item.image)
    }
    
    private func handleError(_ error: NetworkError) {
        if error == .noInternet {
            view?.retry(with: error.description)
        } else {
            view?.showError(with: error.description)
        }
    }
}

extension ListFoodPresenter: ListFoodPresenterProtocol {
    var countFoods: Int {
        foods.count
    }
    
    func fetchFoods() {
        view?.showLoader()
        repository.fetchFoods { [weak self] response in
            guard let self = self else {
                return
            }
            self.view?.hideLoader()
            self.handleResponse(response)
        }
    }
    
    func getFood(at index: Int) -> FoodUIModel {
        foods[index]
    }
}
