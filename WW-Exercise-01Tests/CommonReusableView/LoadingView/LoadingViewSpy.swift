//
//  LoadingViewSpy.swift
//  WW-Exercise-01Tests
//
//  Created by Ahmed Elesawy on 02/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation
@testable import WW_Exercise_01

class LoadingViewSpy {
    // MARK: - Testing Properties
    var isShowLoaderCalled = false
    var isHideLoaderCalled = false
}

// MARK: - Spy Functions
extension LoadingViewSpy: LoadingViewCapable {
    func showLoader() {
        isShowLoaderCalled.toggle()
    }
    func hideLoader() {
        isHideLoaderCalled.toggle()
    }
}
