//
//  ChipViewModel.swift
//  DinoBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 23/06/24.
//

import SwiftUI

class FoodLogViewModel: ObservableObject {
    @Published var servings: [FoodServing] = []
    @Published var calorieCount = 0.0
    @Published var ChipList = [
        ChipModel(isSelected: true, name: "Carbs"),
        ChipModel(isSelected: false, name: "Protein"),
        ChipModel(isSelected: false, name: "Veggie"),
        ChipModel(isSelected: false, name: "Beverages"),
    ]

    func addServing(for food: FoodItem) {
        if let index = servings.firstIndex(where: { $0.food.id == food.id }) {
            servings[index].serving += 1
        } else {
            servings.append(FoodServing(food: food, serving: 1))
        }
        updateCalorieCount()
    }

    func removeServing(for food: FoodItem) {
        if let index = servings.firstIndex(where: { $0.food.id == food.id }) {
            if servings[index].serving == 1 {
                servings.remove(at: index)
            } else {
                servings[index].serving -= 1
            }
        }
        updateCalorieCount()
    }

    private func updateCalorieCount() {
        calorieCount = servings.reduce(0) { $0 + ($1.food.calorie * Double($1.serving)) }
    }
}
