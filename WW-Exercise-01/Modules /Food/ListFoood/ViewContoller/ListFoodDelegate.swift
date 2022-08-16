//
//  ListFoodDelegate.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 16/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import UIKit

protocol ListFoodProtocol: AnyObject {
    func didSelectFood(at index: Int)
}

class ListFoodDelegate: NSObject {
    
    // MARK: - Properties
    private let interItemSpacing = 10
    private let numberItemsPortrait = 2
    private let numberItemsLandscape = 3
    weak var delegate: ListFoodProtocol?
    
    // MARK: - Init
    init(withDelegate delegate: ListFoodProtocol) {
        self.delegate = delegate
    }
}

// MARK: - Collection DelegateFlowLayout
extension ListFoodDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let isPortrait = collectionView.frame.size.width < collectionView.frame.size.height
        let numberItems = isPortrait ? numberItemsPortrait : numberItemsLandscape
        let spacing = interItemSpacing * numberItems
        let fullWidth = collectionView.frame.width - CGFloat(spacing)
        let itemWidth = fullWidth / CGFloat(numberItems)
        return CGSize(width: itemWidth, height: itemWidth)
    }
}

// MARK: - Collection Delegate
extension ListFoodDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        delegate?.didSelectFood(at: index)
    }
}
