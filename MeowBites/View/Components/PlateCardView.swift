//
//  PlateCardView.swift
//  MeowBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 26/06/24.
//

import SwiftData
import SwiftUI

struct PlateCardView: View {
    @Query var plates: [Plate]
    @Environment(\.modelContext) var modelContext
    @EnvironmentObject var viewModel: FoodLogViewModel
    @Query var intakeLogs: [IntakeLog]

    var food: FoodItem
    var amount: Int {
        return intakeLogs.last!.plates.first(where: { $0.food.id == food.id })?.amount ?? 0
    }


    func addServing() {
        viewModel.addServing(modelContext: modelContext, food: food, intakeLogs: intakeLogs)
    }

    func removeServing() {
        viewModel.removeServing(modelContext: modelContext, food: food, intakeLogs: intakeLogs)
    }

    var body: some View {
        HStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 100, height: 100)

            VStack(alignment: .leading) {
                HStack {
                    Text(food.name)
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                    HStack {
                        Image("calorie")
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text("\(String(format: "%.0f", food.calorie)) cal")
                            .font(.footnote)
                    }
                }
                Text("\(String(format: "%.0f", food.portion)) g/\(food.units)")
                    .foregroundStyle(.gray)
                    .font(.footnote)
                HStack {
                    HStack {
                        Image("sugar")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .saturation(0.4)
                        Text("\(String(format: "%.1f", food.sugar)) g")
                            .font(.footnote)
                    }

                    HStack {
                        Image("salt")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .saturation(0.4)
                        Text("\(String(format: "%.1f", food.salt / 1000)) g")
                            .font(.footnote)
                    }

                    HStack {
                        Image("fat")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .saturation(0.4)
                        Text("\(String(format: "%.1f", food.fat)) g")
                            .font(.footnote)
                    }
                }

                HStack(spacing: 36) {
                    Button(action: {
                        removeServing()
                    }) {
                        Image(systemName: "minus")
                            .foregroundStyle(.white)
                            .frame(width: 38, height: 38)
                            .background(.prime)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }

                    Text(String(amount))
                        .font(.subheadline)
                        .fontWeight(.bold)

                    Button(action: {
                        addServing()
                    }) {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                            .frame(width: 38, height: 38)
                            .background(.prime)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
        }
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(.semigray, lineWidth: 2))
    }
}

// #Preview {
//    PlateCardView(
//        name: "Nasi Goreng",
//        calorie: 200.0,
//        sugar: 200.0,
//        salt: 200.0,
//        fat: 200.0,
//        serving: (2),
//        addServing: {},
//        removeServing: {}
//    )
// }
