//
//  Meal.swift
//  sample_app
//
//  Created by Work Mac on 20/6/2023.
//

import Foundation


struct FoodItem {
    let name: String
    let caloriesFor100Grams: Int
    let grams: Int
}

struct Meal {
    private(set) var items: [FoodItem] = []
    
    var calories: Int {
        var calories = 0
        for item in items {
            calories += (item.caloriesFor100Grams / 100) * item.grams
        }
        return calories
    }
    
    mutating func add(_ item: FoodItem) {
        items.append(item)
    }
}
