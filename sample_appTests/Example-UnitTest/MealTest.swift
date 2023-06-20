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

    let banana = FoodItem(name: "Banana", caloriesFor100Grams: 89, grams: 118)
    let steak = FoodItem(name: "Steak", caloriesFor100Grams: 271, grams: 225)
    let goatCheese = FoodItem(name: "Goat Cheese", caloriesFor100Grams: 364, grams: 28)
    
    
    func testCalories() {
            var meal = Meal()
            meal.add(banana)
            meal.add(steak)
            meal.add(goatCheese)
            XCTAssertEqual(meal.items.count, 3)
            XCTAssertEqual(meal.calories, 534)
        }
}
