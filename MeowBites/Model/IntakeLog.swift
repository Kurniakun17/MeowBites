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
    var Date: Date
    var plates: [Plate]
    var isLogged = false

    init(Date: Date, plates: [Plate]) {
        self.Date = Date
        self.plates = plates
    }
}
