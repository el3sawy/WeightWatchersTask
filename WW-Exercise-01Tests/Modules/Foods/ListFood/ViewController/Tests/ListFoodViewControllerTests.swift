//
//  ListFoodViewControllerTests.swift
//  WW-Exercise-01Tests
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import XCTest
@testable import WW_Exercise_01

class ListFoodViewControllerTests: XCTestCase {
    
    private var sut: ListFoodViewController!
    private var presenter: ListFoodPresenterSpy!
    
    override func setUpWithError() throws {
        presenter = ListFoodPresenterSpy()
        sut = ListFoodViewController()
        sut.presenter = presenter
        sut.loadViewIfNeeded()
        sut.viewDidLoad()
        UIApplication.shared.windows.first?.rootViewController = sut
    }
    
    override func tearDownWithError() throws {
        presenter = nil
        sut = nil
    }
    
    func test_viewDidLoad() {
        // When
        sut.viewDidLoad()
        // Then
        XCTAssertTrue(presenter.isFetchFoodsCalled, "Fetch food func not called")
        XCTAssertNotNil(sut.mainView.collectionView.delegate, "Not set delegate for UITCollectionView")
        XCTAssertNotNil(sut.mainView.collectionView.dataSource, "Not set dataSource for UITCollectionView")
    }
    
    func test_showError() {
        sut.showError(with: "")
        XCTAssert(sut.presentedViewController is UIAlertController, "Alert not presenter here")
    }
    
    func test_retry() {
        // When
        sut.retry(with: "")
        // Then
        XCTAssert(sut.presentedViewController is UIAlertController,"Alert not presenter here")
    }
    
    func test_numberOfRows_shouldBe5() {
        // When
        sut.viewDidLoad()
        let rows =  sut.mainView.collectionView.numberOfItems(inSection: 0)
        // Then
        XCTAssertEqual(rows, 5, "Must number of rows be 5")
    }
    
    func test_didSelectRow_withRow1() {
        didSelectRow(in: sut.mainView.collectionView, row: 1)
        XCTAssert(sut.presentedViewController is UIAlertController, "Alert not presenter here")
    }
    
   private func didSelectRow(in collectionView: UICollectionView, row: Int, section: Int = 0) {
       collectionView.delegate?.collectionView?(collectionView, didSelectItemAt: IndexPath(row: row, section: section))
    }
}
