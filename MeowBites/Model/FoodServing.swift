//
//  FoodServing.swift
//  DinoBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 25/06/24.
//

import Foundation

class FoodServing: Identifiable {
    var food: FoodItem
    var serving: Int

    init(food: FoodItem, serving: Int = 0) {
        self.food = food
        self.serving = serving
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
