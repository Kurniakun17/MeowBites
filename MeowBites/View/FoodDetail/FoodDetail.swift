//
//  FoodDetail.swift
//  MeowBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 26/06/24.
//

import SwiftData
import SwiftUI

struct FoodDetail: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: FoodLogViewModel
    @Environment(\.modelContext) var modelContext
    @Query var plates: [Plate]
    var food: FoodItem
    var serving: Int {
        plates.first(where: { $0.food.id == food.id })?.amount ?? 0
    }

    func addServing() {
        viewModel.addServing(modelContext: modelContext, food: food, plates: plates)
    }

    func removeServing() {
        viewModel.removeServing(modelContext: modelContext, food: food, plates: plates)
    }

    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                HStack(spacing: 12) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.black)
                        .frame(width: 110, height: 110)

                    VStack(alignment: .leading, spacing: 12) {
                        Text(food.name)
                            .font(.headline)
                            .fontWeight(.bold)

                        HStack {
                            Image(systemName: "scalemass.fill")
                                .foregroundStyle(.gray)
                            Text("\(String(format: "%.1f", food.portion))g/\(food.units)")
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                        Text("This dish combines the rich and savory taste of sardines with aromatic spices and vegetables.")
                            .font(.footnote)
                    }
                }

                VStack {
                    if food.calorie > 400 {
                        HStack(spacing: 0) {
                            Image("calorie")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding(16)
                                .background(.orangeSoft)
                                .clipShape(RoundedRectangle(cornerRadius: 12))

                            VStack {
                                Text("This food contains high calorie")
                                    .font(.callout)
                                    .padding(.leading, 20)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .background(.orangeSoft.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                    if food.sugar > 22.5 {
                        HStack(spacing: 0) {
                            Image("sugar")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding(16)
                                .background(.orangeSoft)
                                .clipShape(RoundedRectangle(cornerRadius: 12))

                            VStack {
                                Text("This food contains high sugar")
                                    .font(.callout)
                                    .padding(.leading, 20)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .background(.orangeSoft.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                    if food.salt / 1000 > 1.5 {
                        HStack(spacing: 0) {
                            Image("salt")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding(16)
                                .background(.orangeSoft)
                                .clipShape(RoundedRectangle(cornerRadius: 12))

                            VStack {
                                Text("This food contains high salt")
                                    .font(.callout)
                                    .padding(.leading, 20)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .background(.orangeSoft.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                    if food.fat > 17.5 {
                        HStack(spacing: 0) {
                            Image("fat")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .padding(16)
                                .background(.orangeSoft)
                                .clipShape(RoundedRectangle(cornerRadius: 12))

                            VStack {
                                Text("This food contains high fats")
                                    .font(.callout)
                                    .padding(.leading, 20)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .background(.orangeSoft.opacity(0.5))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }

                HStack {
                    VStack(spacing: 16) {
                        NutritionBar(type: "calorie", percentage: 20)
                        VStack(spacing: 0) {
                            Text("\(String(format: "%.0f", food.calorie))")
                                .font(.callout)

                            Text("kcal")
                                .fontWeight(.bold)
                        }
                    }
                    .scaleEffect(0.9)
                    Spacer()
                    VStack(spacing: 16) {
                        NutritionBar(type: "sugar", percentage: 20)
                        VStack(spacing: 0) {
                            Text("\(String(format: "%.1f", food.sugar))")
                                .font(.callout)

                            Text("Sugar")
                                .fontWeight(.bold)
                        }
                    }
                    .scaleEffect(0.9)
                    Spacer()
                    VStack(spacing: 16) {
                        NutritionBar(type: "salt", percentage: 20)
                        VStack(spacing: 0) {
                            Text("\(String(format: "%.1f", food.salt))")
                                .font(.callout)

                            Text("Salt")
                                .fontWeight(.bold)
                        }
                    }
                    .scaleEffect(0.9)
                    Spacer()
                    VStack(spacing: 16) {
//                        MARK: Percentage suit it with fikri's

                        NutritionBar(type: "fat", percentage: 20)
                        VStack(spacing: 0) {
                            Text("\(String(format: "%.1f", food.fat))")
                                .font(.callout)

                            Text("Fat")
                                .fontWeight(.bold)
                        }
                    }
                    .scaleEffect(0.9)
                }

                Spacer()
            }
            .padding(20)

            VStack {
                Spacer()
                VStack(spacing: 32) {
                    HStack {
                        Text("Servings count")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()

                        HStack(spacing: 26) {
                            Button(action: {
                                removeServing()
                            }) {
                                Image(systemName: "minus")
                                    .foregroundStyle(.white)
                                    .frame(width: 38, height: 38)
                                    .background(.prime)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }

                            Text(String(serving))
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
                    Button {
                        addServing()
                    } label: {
                        Text("Add")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .background(.prime)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.prime, lineWidth: 2)
                            }
                    }
                }
                .padding(32)
                .padding(.bottom, 12)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .shadow(color: .black.opacity(0.1), radius: 60)
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                        .padding(14)
                }
            }

            ToolbarItem(placement: .principal) {
                Text("Food Details")
                    .font(.title2)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    FoodDetail(food: FoodItem(
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
    ))
}
