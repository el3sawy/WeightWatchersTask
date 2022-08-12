//
//  TestHelpers.swift
//  WW-Exercise-01Tests
//
//  Created by Ahmed Elesawy on 01/08/2022.
//  Copyright © 2022 Weight Watchers. All rights reserved.
//

import Foundation
import XCTest

extension Bundle {
    public class var testBundle: Bundle {
        return Bundle(for: FoodPresenterTests.self)
    }
}

// MARK: - helpers
func getJSON(bundle: Bundle, for jsonName: String) -> Data {
    guard let path = bundle.path(forResource: jsonName, ofType: "json") else {
        fatalError("Could not retrieve file \(jsonName).json")
    }
    let url = URL(fileURLWithPath: path)
    let data = try! Data(contentsOf: url)
    return data
}

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}
