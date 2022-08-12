//
//  ListFoodViewController.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import UIKit

protocol ListFoodViewProtocol: LoadingViewCapable {
    func reloadTableView()
    func showError(with message: String)
    func retry(with message: String)
}

class ListFoodViewController: UIViewController, PresentableAlert {
    
    // MARK: - Properties
    private(set) var mainView = ListFoodView()
    var presenter: ListFoodPresenterProtocol?
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
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
    private func setupTableView() {
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
}

// MARK: - Collection DataSource
extension ListFoodViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.countFoods ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListFoodCollectionViewCell.identifier,
                                                            for: indexPath) as? ListFoodCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.item = presenter?.getFood(at: indexPath.row)
        return cell
    }
}

// MARK: - Collection DelegateFlowLayout
extension ListFoodViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let isPortrait = view.frame.size.width < view.frame.size.height
        let numberItems = isPortrait ? 2 : 3
        let spacing = 10 * numberItems
        let fullWidth = collectionView.frame.width - CGFloat(spacing)
        let itemWidth = fullWidth / CGFloat(numberItems)
        return CGSize(width: itemWidth, height: itemWidth)
    }
}

// MARK: - Collection Delegate
extension ListFoodViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let title = presenter?.getFood(at: indexPath.row).title ?? ""
        showAlert(with: title)
    }
}

extension ListFoodViewController: ListFoodViewProtocol {
    func reloadTableView() {
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
