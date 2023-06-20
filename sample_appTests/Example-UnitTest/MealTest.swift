//
//  MealTest.swift
//  sample_appTests
//
//  Created by Work Mac on 20/6/2023.
//

import XCTest
@testable import sample_app

final class MealTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmptyMeal() throws {
        let meal = Meal()
        XCTAssertEqual(meal.calories, 0, "An empty meal should have 0 calories")
    }

}
