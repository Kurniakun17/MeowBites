//
//  FoodServing.swift
//  DinoBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 25/06/24.
//

import Foundation

class FoodServing: Identifiable {
    var food: FoodItem
    var serving: Int

    init(food: FoodItem, serving: Int = 0) {
        self.food = food
        self.serving = serving
    }
}
