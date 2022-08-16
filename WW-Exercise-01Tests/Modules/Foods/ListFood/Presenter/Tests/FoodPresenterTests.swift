//
//  FoodPresenterTests.swift
//  WW-Exercise-01Tests
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import XCTest
@testable import WW_Exercise_01

class FoodPresenterTests: XCTestCase {

    private var sut: ListFoodPresenter!
    private var repository: FoodRepositoryMock!
    private var view: ListFoodViewSpy!
    
    override func setUpWithError() throws {
        repository = FoodRepositoryMock()
        view = ListFoodViewSpy()
        sut = ListFoodPresenter(repository: repository, view: view)
    }

    override func tearDownWithError() throws {
        view = nil
        repository = nil
        sut = nil
    }
    
    func test_fetchFoods_successResponse() {
        // When
        sut.fetchFoods()
        repository.simulateSuccessResponse()
        // Then
        XCTAssertTrue(view.isShowLoaderCalled, "Loader not presenter")
        XCTAssertTrue(view.isHideLoaderCalled, "Loader not hide")
        XCTAssertTrue(view.isReloadTableViewCalled, "Reload tableView not called")
    }
    
    func test_fetchFoods_failResponse() {
        // When
        sut.fetchFoods()
        repository.simulateFailResponse()
        // Then
        XCTAssertTrue(view.isShowLoaderCalled, "Loader not presenter")
        XCTAssertTrue(view.isHideLoaderCalled, "Loader not hide")
        XCTAssertTrue(view.isShowErrorCalled, "Show an error not called")
    }
    
    func test_fetchFoods_failResponse_noInternet() {
        // When
        sut.fetchFoods()
        repository.simulateFailResponseWithNoInternet()
        // Then
        XCTAssertTrue(view.isShowLoaderCalled, "Loader not presenter")
        XCTAssertTrue(view.isHideLoaderCalled, "Loader not hide")
        XCTAssertTrue(view.isRetryCalled, "Alert for retry fetch foods not called")
    }
    
    func test_fetchFoods_getModel_successResponse() {
        // Given
        let title = FoodStubs.createListFood()[0].title
        // When
        sut.fetchFoods()
        repository.simulateSuccessResponse()
        
        // Then
        XCTAssertTrue(view.isShowLoaderCalled, "Loader not presenter")
        XCTAssertTrue(view.isHideLoaderCalled, "Loader not hide")
        XCTAssertTrue(view.isReloadTableViewCalled, "Reload tableView not called")
        XCTAssertEqual(sut.getFood(at: 0).title, title, "Title not get prefect")
    }
    
    func test_fetchFoods_memoryLeaks_successResponse() {
        // When
        sut.fetchFoods()
        repository.simulateSuccessResponse()
        // Then
        trackForMemoryLeaks(sut)
        sut = nil
    }
}
