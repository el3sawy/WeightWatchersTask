//
//  LoadingViewTests.swift
//  WW-Exercise-01Tests
//
//  Created by Ahmed Elesawy on 02/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import XCTest
@testable import WW_Exercise_01

class LoadingViewTests: XCTestCase {
    var sut: ListFoodViewController!
    override func setUpWithError() throws {
        sut = FoodConfigurator.getViewController(with: .listFoods) as? ListFoodViewController
        UIApplication.shared.windows.first?.rootViewController = sut
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    func test_showLoader() {
        sut.showLoader()
        XCTAssert(sut.view.subviews.contains(LoadingView.shared), "Loader not presenter successfully")
    }
    func test_hideLoader() {
        sut.hideLoader()
        XCTAssertFalse(sut.view.subviews.contains(LoadingView.shared), "Loader not hid successfully")
    }
    func test_initCoder() {
        let view = LoadingView(coder: NSCoder())
        XCTAssertNil(view, "View must be nil here")
    }
}
