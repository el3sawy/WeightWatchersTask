//
//  ListFoodTableViewCell.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import UIKit

class ListFoodCollectionViewCell: BaseViewCell {
    
    // MARK: - Properties
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .label
        label.textAlignment = .center
        return label
    }()
    
    private lazy var imageFood = UIImageView()
    private lazy var mainView = UIView()
    static let identifier = String(describing: ListFoodCollectionViewCell.self)
    
    override func setupView() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        setupMainView()
        setupImageFood()
        setupMainStackView()
    }
    
    private func setupMainView() {
        addSubview(mainView)
        mainView.viewFillConstrains(superView: self, distance: 5)
        mainView.layer.cornerRadius = 6
        mainView.backgroundColor = .systemBackground
    }
    
    private func setupImageFood() {
        imageFood.clipsToBounds = true
        imageFood.contentMode = .scaleToFill
        imageFood.layer.cornerRadius = 6
        imageFood.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
    }
    
    private func setupMainStackView() {
        titleLabel.heightSize(size: 25)
        let stack = UIStackView(views: [imageFood, titleLabel], alignment: .fill, distribution: .fill, spacing: 0).makeVertical
        mainView.addSubview(stack)
        stack.clipsToBounds = true
        stack.viewFillConstrains(superView: mainView, distance: 0)
    }
    
    var item: FoodUIModel? {
        didSet {
            titleLabel.text = item?.title
            imageFood.load(with: item?.imagePath)
        }
    }
}
