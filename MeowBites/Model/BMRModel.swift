//
//  BMRModel.swift
//  MeowBites
//
//  Created by Dinda Ayu Syafitri on 26/06/24.
//

import Foundation
import SwiftData

@Model
class BMRData: Identifiable {
    var calorie: Double
    var sugar: Double
    var salt: Double
    var fat: Double

    init(calorie: Double, sugar: Double, salt: Double, fat: Double) {
        self.calorie = calorie
        self.sugar = sugar
        self.salt = salt
        self.fat = fat
    }
}
