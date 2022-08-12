//
//  ListFoodView.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import UIKit

class ListFoodView: BaseView {
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
       let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(ListFoodCollectionViewCell.self, forCellWithReuseIdentifier: ListFoodCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func setupView() {
        backgroundColor = .systemGray3
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.viewFillConstrains(superView: self, distance: 5)
    }
}
