//
//  FoodList.swift
//  MeowBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 26/06/24.
//

import SwiftData
import SwiftUI

struct FoodList: View {
    @EnvironmentObject var viewModel: FoodLogViewModel
    var sort: String

    var body: some View {
        ForEach(viewModel.filteredFoodList().chunked(into: 2), id: \.self) { rowItems in
            HStack(spacing: 20) {
                ForEach(rowItems) { food in
                    FoodCardView(
                        food: food,
                        sort: sort
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

    init(sort: String) {
        self.sort = sort
//        _foodsList = Query(sort: [sortByType(sort: sort)])
    }
}

#Preview {
    FoodList(sort: "fat")
}
