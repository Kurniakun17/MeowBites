//
//  FoodCardView.swift
//  DinoBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 23/06/24.
//

import SwiftData
import SwiftUI

struct FoodCardView: View {
    @EnvironmentObject var viewModel: FoodLogViewModel
    @Environment(\.modelContext) var modelContext
    @Query var plates: [Plate]
    @Query var intakeLogs: [IntakeLog]
    var food: FoodItem
    var amount: Int {
        intakeLogs.last!.plates.first(where: { $0.food.id == food.id })?.amount ?? 0
    }

    var sort: String

    func nutrientValue() -> String {
        if sort == "fat" {
            return String(format: "%.1f", food.fat) + "g"
        } else if sort == "salt" {
            return String(format: "%.1f", food.salt / 1000) + "g"
        } else if sort == "sugar" {
            return String(format: "%.1f", food.sugar) + "g"
        } else {
            return String(format: "%.1f", food.calorie)
        }
    }

    func addServing() {
        viewModel.addServing(modelContext: modelContext, food: food, plates: intakeLogs.last!.plates)
    }

    func removeServing() {
        viewModel.removeServing(modelContext: modelContext, food: food, plates: intakeLogs.last!.plates)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            NavigationLink(destination: {
                FoodDetail(food: food)
            }) {
                HStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .padding(.bottom, 4)
            }

            VStack(alignment: .leading) {
                NavigationLink(destination: { FoodDetail(food: food) }) {
                    VStack(alignment: .leading) {
                        Text(food.name)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)

                        HStack(spacing: 4) {
                            Image(sort)
                                .resizable()
                                .frame(width: 16, height: 16)
                            Text(String(nutrientValue()) + " " + sort)
                                .fontWeight(.bold)
                                .font(.caption)
                        }

                        Text("\(String(format: "%.0f", food.portion))g / \(food.units)")
                            .fontWeight(.bold)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }

                if amount == 0 {
                    Button(action: {
                        addServing()
                    }) {
                        Text("add")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .padding(.vertical, 1)
                            .font(.callout)
                            .foregroundStyle(.white)
                            .background(.prime)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                } else {
                    HStack {
                        Button(action: {
                            removeServing()
                        }) {
                            Image(systemName: "minus")
                                .foregroundStyle(.white)
                                .frame(width: 38, height: 38)
                                .background(.prime)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }

                        Spacer()

                        Text(String(amount))
                            .font(.subheadline)
                            .fontWeight(.semibold)

                        Spacer()

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
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(0)
        }
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(.gray, lineWidth: 0.5))
    }
}
