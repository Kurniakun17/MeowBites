//
//  ChipViewModel.swift
//  DinoBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 23/06/24.
//

import SwiftData
import SwiftUI

class FoodLogViewModel: ObservableObject {
    @Published var selectedFood: [Plate] = []
    @Published var foodsList = [
        FoodItem(
            id: 1,
            name: "Nasi Goreng",
            calorie: 500.0,
            sugar: 5.0,
            salt: 500.0,
            fat: 10.0,
            portion: 1.0,
            units: "serving",
            imgName: "nasi_goreng",
            type: "Carbs"
        ),
        FoodItem(
            id: 2,
            name: "Ikan Goreng",
            calorie: 180.0,
            sugar: 2.0,
            salt: 300.0,
            fat: 6.0,
            portion: 1.0,
            units: "serving",
            imgName: "ikan_goreng",
            type: "Protein"
        ),
        FoodItem(
            id: 3,
            name: "Ayam Geprek",
            calorie: 200.0,
            sugar: 5.0,
            salt: 700.0,
            fat: 10.0,
            portion: 1.0,
            units: "serving",
            imgName: "Ayam Geprek",
            type: "Protein"
        ),
        FoodItem(
            id: 4,
            name: "Mie Goreng",
            calorie: 350.0,
            sugar: 4.0,
            salt: 400.0,
            fat: 8.0,
            portion: 1.0,
            units: "serving",
            imgName: "mie_goreng",
            type: "Carbs"
        ),
        FoodItem(
            id: 5,
            name: "Sate Ayam",
            calorie: 300.0,
            sugar: 3.0,
            salt: 200.0,
            fat: 12.0,
            portion: 1.0,
            units: "serving",
            imgName: "sate_ayam",
            type: "Protein"
        ),
        FoodItem(
            id: 6,
            name: "Salad Sayur",
            calorie: 120.0,
            sugar: 2.0,
            salt: 100.0,
            fat: 5.0,
            portion: 1.0,
            units: "serving",
            imgName: "salad_sayur",
            type: "Veggie"
        ),
        FoodItem(
            id: 7,
            name: "Jus Jeruk",
            calorie: 150.0,
            sugar: 25.0,
            salt: 10.0,
            fat: 0.5,
            portion: 1.0,
            units: "serving",
            imgName: "jus_jeruk",
            type: "Beverages"
        ),
        FoodItem(
            id: 8,
            name: "Rendang Daging",
            calorie: 400.0,
            sugar: 3.0,
            salt: 600.0,
            fat: 15.0,
            portion: 1.0,
            units: "serving",
            imgName: "rendang_daging",
            type: "Protein"
        ),
    ]

    @Published var calorieCount = 0.0
    @Published var sugarCount = 0.0
    @Published var saltCount = 0.0
    @Published var fatCount = 0.0
    @Published var ChipList = [
        ChipModel(isSelected: true, name: "All"),
        ChipModel(isSelected: false, name: "Carbs"),
        ChipModel(isSelected: false, name: "Protein"),
        ChipModel(isSelected: false, name: "Veggie"),
        ChipModel(isSelected: false, name: "Beverages"),
    ]
    @Published var filter = "All"
    @Published var sortBy = "calorie"
    @Published var character_mood = "good"

    func addServing(modelContext: ModelContext, food: FoodItem, plates: [Plate]) {
        if let index = plates.firstIndex(where: { $0.food.id == food.id }) {
            plates[index].amount += 1
        } else {
            modelContext.insert(Plate(food: food, amount: 1))
        }

        increaseNutrientCount(food: food)
    }

    func removeServing(modelContext: ModelContext, food: FoodItem, plates: [Plate]) {
        if let index = plates.firstIndex(where: { $0.food.id == food.id }) {
            if plates[index].amount == 1 {
                modelContext.delete(plates[index])
            } else {
                plates[index].amount -= 1
            }
        }

        decreaseNutrientCount(food: food)
    }

    func filteredFoodList() -> [FoodItem] {
        let filteredList = filter == "All" ? foodsList : foodsList.filter { $0.type == filter }

        return filteredList.sorted {
            a, b in

            switch sortBy {
            case "calorie":
                return a.calorie < b.calorie
            case "fat":
                return a.fat < b.fat
            case "salt":
                return a.salt < b.salt

            case "sugar":
                return a.sugar < b.sugar
            default:
                return a.calorie < b.calorie
            }
        }
    }

    func updateNutrientCount(plates: [Plate]) {
        var newCalorieCount = 0.0
        var newSugarCount = 0.0
        var newSaltCount = 0.0
        var newFatCount = 0.0

        for plate in plates {
            newCalorieCount += plate.food.calorie * Double(plate.amount)
            newSugarCount += plate.food.sugar * Double(plate.amount)
            newSaltCount += plate.food.salt * Double(plate.amount)
            newFatCount += plate.food.fat * Double(plate.amount)
        }

        calorieCount = newCalorieCount
        sugarCount = newSugarCount
        saltCount = newSaltCount
        fatCount = newFatCount

        updateMood()
    }

    private func increaseNutrientCount(food: FoodItem) {
        calorieCount += food.calorie
        sugarCount += food.sugar
        saltCount += food.salt
        fatCount += food.fat

        updateMood()
    }

    private func decreaseNutrientCount(food: FoodItem) {
        calorieCount -= food.calorie
        sugarCount -= food.sugar
        saltCount -= food.salt
        fatCount -= food.fat

        updateMood()
    }
    
    func generateSortDescriptor() -> SortDescriptor<Plate> {
        switch sortBy {
            case "calorie":
                return SortDescriptor(\Plate.food.calorie)
            case "sugar":
                return SortDescriptor(\Plate.food.sugar)
            case "salt":
                return SortDescriptor(\Plate.food.salt)
            case "fat":
                return SortDescriptor(\Plate.food.fat)
            default:
                return SortDescriptor(\Plate.food.calorie)
        }
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
}
