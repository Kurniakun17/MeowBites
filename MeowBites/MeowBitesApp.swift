//
//  MeowBitesApp.swift
//  MeowBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 26/06/24.
//

import SwiftData
import SwiftUI

@main
struct MeowBitesApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingStart()
        }
        .modelContainer(for: [UserPersonalData.self, BMRData.self, FoodItem.self, IntakeLog.self, Plate.self, DailyIntakeLog.self])
    }
}
