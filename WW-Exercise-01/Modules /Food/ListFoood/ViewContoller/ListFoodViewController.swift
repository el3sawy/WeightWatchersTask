//
//  ListFoodViewController.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import UIKit

protocol ListFoodViewProtocol: LoadingViewCapable {
    func reloadCollectionView(with foods: [FoodUIModel])
    func showError(with message: String)
    func retry(with message: String)
}

class ListFoodViewController: UIViewController, PresentableAlert {
    
    // MARK: - Properties
    private(set) var mainView = ListFoodView()
    private let dataSource = ListFoodDataSource()
    private var delegate: ListFoodDelegate?
    var presenter: ListFoodPresenterProtocol?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        presenter?.fetchFoods()
    }
    
    override func loadView() {
        super.loadView()
        view  = mainView
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        mainView.collectionView.reloadData()
    }
    
    // MARK: - Functions
    private func setupCollectionView() {
        delegate = ListFoodDelegate(withDelegate: self)
        mainView.collectionView.delegate = delegate
        mainView.collectionView.dataSource = dataSource
    }
}

// MARK: - Delegate actions
extension ListFoodViewController: ListFoodProtocol {
    func didSelectFood(at index: Int) {
        let title = presenter?.getFood(at: index).title ?? ""
        showAlert(with: title)
    }
}

extension ListFoodViewController: ListFoodViewProtocol {
    func reloadCollectionView(with foods: [FoodUIModel]) {
        dataSource.foods = foods
        mainView.collectionView.reloadData()
    }
    
    func showError(with message: String) {
        showAlert(with: message)
    }
    
    func retry(with message: String) {
        showAlert(with: message) { [weak self] _ in
            self?.presenter?.fetchFoods()
        }
    }
}
