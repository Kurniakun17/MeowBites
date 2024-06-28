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
            Home()
        }
        .modelContainer(for: [UserPersonalData.self, BMRData.self, Plate.self, FoodItem.self])
    }
}
