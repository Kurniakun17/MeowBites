//
//  FoodModel.swift
//  DinoBites
//
//  Created by Dinda Ayu Syafitri on 23/06/24.
//

import Foundation
import SwiftData

@Model
class FoodItem: Identifiable {
    var id: Int
    var name: String
    var calorie: Double
    var sugar: Double
    var salt: Double
    var fat: Double
    var portion: Double
    var units: String
    var imgName: String
    var type: String

    init(id: Int, name: String, calorie: Double, sugar: Double, salt: Double, fat: Double, portion: Double, units: String, imgName: String, type: String) {
        self.id = id
        self.name = name
        self.calorie = calorie
        self.sugar = sugar
        self.salt = salt
        self.fat = fat
        self.portion = portion
        self.units = units
        self.imgName = imgName
        self.type = type
    }
}
