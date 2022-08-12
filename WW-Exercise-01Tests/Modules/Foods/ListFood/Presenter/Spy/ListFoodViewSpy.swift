//
//  ListFoodViewSpy.swift
//  WW-Exercise-01Tests
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation
@testable import WW_Exercise_01

class ListFoodViewSpy {
    // MARK: - Testing Properties
    var isReloadTableViewCalled = false
    var isShowErrorCalled = false
    var isRetryCalled = false
    var isShowLoaderCalled = false
    var isHideLoaderCalled = false
}

// MARK: - Spy Functions
extension ListFoodViewSpy: ListFoodViewProtocol {
    func reloadTableView() {
        isReloadTableViewCalled.toggle()
    }
    
    func showError(with message: String) {
        isShowErrorCalled.toggle()
    }
    
    func retry(with message: String) {
        isRetryCalled.toggle()
    }
    
    func showLoader() {
        isShowLoaderCalled.toggle()
    }
    
    func hideLoader() {
        isHideLoaderCalled.toggle()
    }
}
