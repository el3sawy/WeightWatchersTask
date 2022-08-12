//
//  LoadingViewCapable.swift
//  WW-Exercise-01
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import UIKit

protocol LoadingViewCapable: AnyObject {
    func showLoader()
    func hideLoader()
}

extension LoadingViewCapable where Self: UIViewController {
    func showLoader() {
        let loader = LoadingView.shared
        view.addSubview(loader)
        view.bringSubviewToFront(loader)
        
        loader.heightSize(size: 80)
        loader.widthSize(size: 80)
        loader.centerX(anchor: view.centerXAnchor)
        loader.centerY(anchor: view.centerYAnchor)
        loader.activityIndicator.startAnimating()
    }
    func hideLoader() {
        let loader = LoadingView.shared
        loader.removeFromSuperview()
    }
}
