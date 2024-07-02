//
//  DailyIntake.swift
//  MeowBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 02/07/24.
//
import Foundation
import SwiftData

@Model
class IntakeLog: Identifiable {
    var date = Date()
    var plates: [Plate] = []
    var calorie = 0.0
    var sugar = 0.0
    var salt = 0.0
    var fat = 0.0
    var isLogged = false

    init(Date: Date, plates: [Plate]) {
        self.date = Date
        self.plates = plates
    }
}


 @Model
class DailyIntakeLog: Identifiable {
    var date: Date
    var calorie = 0.0
    var sugar = 0.0
    var salt = 0.0
    var fat = 0.0
    var intakeLogs: [IntakeLog] = []

    init(Date: Date, calorie: Double = 0.0, sugar: Double = 0.0, salt: Double = 0.0, fat: Double = 0.0, intakeLogs: [IntakeLog]) {
        self.date = Date
        self.calorie = calorie
        self.sugar = sugar
        self.salt = salt
        self.fat = fat
        self.intakeLogs = intakeLogs
    }
}
