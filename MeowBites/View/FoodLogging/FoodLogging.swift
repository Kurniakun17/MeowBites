//
//  FoodLogging.swift
//  DinoBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 21/06/24.
//

import SwiftData
import SwiftUI

struct FoodLogging: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var modelContext
    @EnvironmentObject var viewModel: FoodLogViewModel
    @State private var sortOrder = "calorie"
//    @Query var plates: [Plate]
    @Query var intakeLogs: [IntakeLog]

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
//                        HStack {
//                            Button(action: {
//                                ()
//
//                            }) {
//                                Text("Remove Item")
//                            }
//                            Spacer()
//                            Button(action: {}) {
//                                Text("Add Item")
//                            }
//                        }
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(viewModel.ChipList) {
                                    chip in FilterChip(
                                        filter: viewModel.filter,
                                        name: chip.name,
                                        onTap: {
                                            viewModel.filter = chip.name
                                        }
                                    )
                                }
                            }
                        }
                        .padding(.horizontal, 20)

                        VStack(alignment: .leading, spacing: 20) {
                            HStack {
                                Text("Try these!")
                                    .font(.title)
                                    .fontWeight(.bold)

                                Spacer()

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
                                .scaleEffect(0.8)
                            }

                            FoodList(sort: viewModel.sortBy)
                        }
                        .padding(20)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.top, 24)
                .padding(.bottom, 200)
            }
            .background(.white)

            VStack {
                Spacer()
                LogSummary()
            }
            .ignoresSafeArea()
        }
        .onAppear{
            viewModel.updateNutrientCount(plates: intakeLogs.last!.plates)
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
                Text("Food")
                    .font(.title2)
                    .fontWeight(.bold)
            }

            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                        .padding(14)
                }
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Plate.self, configurations: config)

        return FoodLogging().modelContainer(container)
            .environmentObject(FoodLogViewModel())

    } catch {
        fatalError("Model")
    }
}
