//
//  FoodServing.swift
//  DinoBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 25/06/24.
//

import Foundation
import SwiftData

@Model
class Plate: Identifiable {
    var food: FoodItem
    var amount: Int

    init(food: FoodItem, amount: Int = 0) {
        self.food = food
        self.amount = amount
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        var chunks: [[Element]] = []
        for index in stride(from: 0, to: count, by: size) {
            let chunk = Array(self[index ..< Swift.min(index + size, count)])
            chunks.append(chunk)
        }
        return chunks
    }
}
