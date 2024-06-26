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
    @Query(sort: [SortDescriptor(\FoodItem.calorie), SortDescriptor(\FoodItem.sugar)]) var foodsList: [FoodItem]
    @EnvironmentObject var viewModel: FoodLogViewModel
    @State private var sortOrder = SortDescriptor(\FoodItem.calorie)

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
//                       MARK: Seed data

//                        HStack {
//                            Button(action: {
//                                ()
//
//                            }) {
//                                Text("Remove Item")
//                            }
//                            Spacer()
//                            Button(action: {
                        ////                                addSamples()
//                                viewModel.addToModelContext(modelContext: modelContext)
//                            }) {
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

//                                HStack {
                                Picker("Select a paint color", selection: $sortOrder) {
                                    Image("calorie")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                        .tag(SortDescriptor(\FoodItem.calorie))

                                    Image("sugar")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                        .tag(SortDescriptor(\FoodItem.sugar))

                                    Image("salt")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                        .tag(SortDescriptor(\FoodItem.salt))

                                    Image("fat")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                        .tag(SortDescriptor(\FoodItem.fat))
                                }
                                .pickerStyle(.menu)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 3)
                                .background(.semigray)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .scaleEffect(0.8)
                            }

                            FoodList(sort: sortOrder)
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

    func addSamples() {
        let nasiGoreng = FoodItem(
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
        )

        let ikanGoreng =
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
            )

        let ayamGeprek =
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
            )

        let mieGoreng = FoodItem(
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
        )

        let sateAyam = FoodItem(
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
        )

        let saladSayur = FoodItem(
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
        )

        let jusJeruk = FoodItem(
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
        )

        let rendangDaging = FoodItem(
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
        )

        modelContext.insert(mieGoreng)
        modelContext.insert(sateAyam)
        modelContext.insert(saladSayur)
        modelContext.insert(saladSayur)
        modelContext.insert(jusJeruk)
        modelContext.insert(rendangDaging)
    }

    func removeSamples() {
        for food in foodsList {
            modelContext.delete(food)
        }
    }
}

#Preview {
    FoodLogging()
        .environmentObject(FoodLogViewModel())
}

//
// @State var foodsList = [
//    FoodItem(
//        id: 3,
//        name: "Ayam Geprek",
//        calorie: 200.0,
//        sugar: 5.0,
//        salt: 700.0,
//        fat: 10.0,
//        portion: 1.0,
//        units: "serving",
//        imgName: "Ayam Geprek",
//        type: "Protein"
//    ),
//    FoodItem(
//        id: 2,
//        name: "Ikan Goreng",
//        calorie: 180.0,
//        sugar: 2.0,
//        salt: 300.0,
//        fat: 6.0,
//        portion: 1.0,
//        units: "serving",
//        imgName: "ikan_goreng",
//        type: "Protein"
//    ),
//    FoodItem(
//        id: 1,
//        name: "Nasi Goreng",
//        calorie: 500.0,
//        sugar: 5.0,
//        salt: 500.0,
//        fat: 10.0,
//        portion: 1.0,
//        units: "serving",
//        imgName: "nasi_goreng",
//        type: "Carbs"
//    ),
// ]
