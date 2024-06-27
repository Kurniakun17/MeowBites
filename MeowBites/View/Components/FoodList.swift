//
//  FoodList.swift
//  MeowBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 26/06/24.
//

import SwiftData
import SwiftUI

struct FoodList: View {
    @Query var foodsList: [FoodItem]
    @EnvironmentObject var viewModel: FoodLogViewModel

    var filteredFoodList: [FoodItem] {
        foodsList.filter { $0.type == viewModel.filter }
    }

    var body: some View {
        ForEach(filteredFoodList.chunked(into: 2), id: \.self) { rowItems in
            HStack(spacing: 20) {
                ForEach(rowItems) { food in
                    FoodCardView(
                        id: food.id,
                        name: food.name,
                        portion: food.portion,
                        units: food.units,
                        calorie: food.calorie,
                        serving: (viewModel.getFoodServing(id: food.id) != nil) ? viewModel.getFoodServing(id: food.id)!.serving : 0,
                        addServing: { viewModel.addServing(for: food)
                        },
                        removeServing: { viewModel.removeServing(for: food)
                        }
                    )
                    .environmentObject(viewModel)
                }
                // Fill remaining space if there's only one item in the row
                if rowItems.count == 1 {
                    Spacer()
                    Rectangle()
                        .fill(.white)
                }
            }
        }
    }

    init(sort: SortDescriptor<FoodItem>) {
        _foodsList = Query(sort: [sort])
    }
}

#Preview {
    FoodList(sort: SortDescriptor(\FoodItem.fat))
}
