//
//  ChipViewModel.swift
//  DinoBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 23/06/24.
//

import SwiftData
import SwiftUI

class FoodLogViewModel: ObservableObject {
    @Published var selectedFood: [FoodServing] = []
    @Published var calorieCount = 0.0
    @Published var sugarCount = 0.0
    @Published var saltCount = 0.0
    @Published var fatCount = 0.0
    @Published var ChipList = [
        ChipModel(isSelected: true, name: "Carbs"),
        ChipModel(isSelected: false, name: "Protein"),
        ChipModel(isSelected: false, name: "Veggie"),
        ChipModel(isSelected: false, name: "Beverages"),
    ]
    @Published var filter = "Carbs"
    @Published var character_mood = "good"

    func addServing(for food: FoodItem) {
        if let index = selectedFood.firstIndex(where: { $0.food.id == food.id }) {
            selectedFood[index].serving += 1
        } else {
            selectedFood.append(FoodServing(food: food, serving: 1))
        }
        updateNutrientCount()
    }

    func getFoodServing(id: Int) -> FoodServing? {
        return selectedFood.first(where: { $0.food.id == id })
    }

    func addToModelContext(modelContext: ModelContext) {
        modelContext.insert(FoodItem(
            id: 9,
            name: "Bakso",
            calorie: 250.0,
            sugar: 3.0,
            salt: 400.0,
            fat: 12.0,
            portion: 1.0,
            units: "serving",
            imgName: "bakso",
            type: "Protein"
        )
        )
    }

    func removeServing(for food: FoodItem) {
        if let index = selectedFood.firstIndex(where: { $0.food.id == food.id }) {
            if selectedFood[index].serving == 1 {
                selectedFood.remove(at: index)
            } else {
                selectedFood[index].serving -= 1
            }
        }
        updateNutrientCount()
    }

    func updateMood() {
        if calorieCount > 1700 {
            character_mood = "danger"
        } else if calorieCount > 1200 {
            character_mood = "warning"
        } else {
            character_mood = "good"
        }
    }

    private func updateNutrientCount() {
        calorieCount = selectedFood.reduce(0) { $0 + ($1.food.calorie * Double($1.serving)) }
        sugarCount = selectedFood.reduce(0) { $0 + ($1.food.sugar * Double($1.serving)) }
        saltCount = selectedFood.reduce(0) { $0 + ($1.food.salt * Double($1.serving)) }
        fatCount = selectedFood.reduce(0) { $0 + ($1.food.fat * Double($1.serving)) }

        updateMood()
    }
}
