//
//  FoodReview.swift
//  DinoBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 23/06/24.
//

import SwiftData
import SwiftUI

struct FoodPlate: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: FoodLogViewModel
    @Query var plates: [Plate]

    var body: some View {
        ZStack {
            VStack {
                LogSummary(isPlatePage: true)
                    .padding(.horizontal, 20)
                    .padding(.top, 16)

                ScrollView(.vertical) {
                    VStack {
                        VStack(alignment: .leading, spacing: 16) {
                            VStack(alignment: .leading, spacing: 16) {
                                HStack {
                                    Text("Sort by:")

                                    Picker("Select a paint color", selection: $viewModel.sortBy) {
                                        Image("calorie")
                                            .resizable()
                                            .frame(width: 12, height: 12)
                                            .tag("calorie")

                                        Image("sugar")
                                            .resizable()
                                            .frame(width: 12, height: 12)
                                            .tag("sugar")

                                        Image("salt")
                                            .resizable()
                                            .frame(width: 12, height: 12)
                                            .tag("salt")

                                        Image("fat")
                                            .resizable()
                                            .frame(width: 12, height: 12)
                                            .tag("fat")
                                    }
                                    .pickerStyle(.menu)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 3)
                                    .background(.semigray)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    .scaleEffect(0.6)
                                    .offset(x: -20)
                                }

                                VStack(spacing: 10) {
                                    ForEach(plates) { plate in
                                        PlateCardView(
                                            food: plate.food
                                        )
                                    }
                                }
                            }
                        }
                        .padding(20)
                    }
                }
                .padding(.bottom, 90)
            }

            VStack {
                Spacer()

                HStack(spacing: 16) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Add more")
                            .foregroundStyle(.prime)
                            .font(.headline)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.prime, lineWidth: 2)
                            }
                    }
                    Button {} label: {
                        Text("Log")
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
                Text("Meow's Plate")
                    .font(.title2)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    FoodPlate()
        .environmentObject(FoodLogViewModel())
}
