//
//  LoadingView.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    static let shared = LoadingView()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.tintColor = .systemBlue
        activityIndicator.color = .systemGray
        return activityIndicator
    }()
    
    private init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        addSubview(activityIndicator)
        backgroundColor = .systemBackground
        layer.cornerRadius = 10
        
        activityIndicator.centerX(anchor: centerXAnchor)
        activityIndicator.centerY(anchor: centerYAnchor)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}
