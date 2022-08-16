//
//  ListFoodDataSource.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 16/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import UIKit

class ListFoodDataSource: NSObject {
    var foods: [FoodUIModel] = []
}

extension ListFoodDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        foods.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListFoodCollectionViewCell.identifier,
                                                            for: indexPath) as? ListFoodCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.item = foods[indexPath.row]
        return cell
    }
}
