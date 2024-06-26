//
//  UserPersonalDataModel.swift
//  MeowBites
//
//  Created by Dinda Ayu Syafitri on 26/06/24.
//

import Foundation
import SwiftData

@Model
class UserPersonalData: Identifiable {
    var gender: String
    var age: Int
    var weight: Double
    var height: Double

    init(gender: String, age: Int, weight: Double, height: Double) {
        self.gender = gender
        self.age = age
        self.weight = weight
        self.height = height
    }
}
