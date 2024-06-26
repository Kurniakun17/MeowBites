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
    @Query var foodsList: [FoodItem]
    @ObservedObject var viewModel = FoodLogViewModel()
    @State var filter = "Carbs"
    @State var characterMood = ""
    @State var isCooldownActive = false
    
    func updateCharacter() {
        if viewModel.calorieCount > 500 {
            characterMood = "_overcal"
            return
        }
        
        if !isCooldownActive {
            characterMood = "_love"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                isCooldownActive = false
                if viewModel.calorieCount < 500 {
                    characterMood = ""
                }
            }
        }
        
        isCooldownActive = true
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Button(action: {
                                removeSamples()
                                
                            }) {
                                Text("Remove Item")
                            }
                            Spacer()
                            Button(action: {
                                addSamples()
                                
                            }) {
                                Text("Add Item")
                            }
                        }
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) {
                                ForEach(viewModel.ChipList) {
                                    chip in FilterChip(
                                        filter: filter,
                                        name: chip.name,
                                        onTap: {
                                            filter = chip.name
                                        }
                                    )
                                }
                            }
                        }
                        .padding(.leading, 20)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Try these!")
                                .font(.title)
                                .fontWeight(.bold)

//                            MARK: Option 1

                            ForEach(foodsList) {
                                food in FoodCardView(name: food.name, portion: food.portion, units: food.units, calorie: food.calorie)
                            }
                            
//                            MARK: Option 2

//                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
//                                ForEach(foodsList) {
//                                    food in FoodCardView(name: food.name, portion: food.portion, units: food.units, calorie: food.calorie)
//                                }
//                            }
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
     
        .onAppear {
            print(foodsList)
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
                    .font(.title)
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

        modelContext.insert(nasiGoreng)
        modelContext.insert(ikanGoreng)
        modelContext.insert(ayamGeprek)
    }
    
    func removeSamples() {
        for food in foodsList {
            modelContext.delete(food)
        }
    }
}

#Preview {
    FoodLogging()
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
