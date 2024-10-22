//
//  LogSummary.swift
//  DinoBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 25/06/24.
//

import SwiftData
import SwiftUI

struct StateItem {
    let title: String
    let color: Color
    let face: String
}

// Define a dictionary to hold the states
let state: [String: StateItem] = [
    "good": StateItem(title: "Good Choice", color: Color.sucessBackground, face: "happy"),
    "warning": StateItem(title: "The fat is high!", color: Color.warningBackground, face: "sad"),
    "danger": StateItem(title: "You take too much calorie", color: Color.dangerBackground, face: "dizzy")
]

struct LogSummary: View {
    @EnvironmentObject var viewModel: FoodLogViewModel
    @Query var intakeLogs: [IntakeLog]
    @State var goToPlate = false
    var isPlatePage = false

    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                VStack {
                    Text(state[viewModel.character_mood]!.title)
                        .foregroundStyle(.black)
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: 200, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .leading) {
                    Text("Remaining Nutrient")
                        .font(.footnote)

                    HStack {
                        HStack {
                            Image("calorie")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .saturation(0.4)
                            Text("\(String(format: "%.0f", intakeLogs.last!.calorie)) kcal")
                                .font(.footnote)
                        }

                        HStack {
                            Image("sugar")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .saturation(0.4)
                            Text("\(String(format: "%.1f", intakeLogs.last!.sugar)) g")
                                .font(.footnote)
                        }

                        HStack {
                            Image("salt")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .saturation(0.4)
                            Text("\(String(format: "%.1f", intakeLogs.last!.salt / 1000)) g")
                                .font(.footnote)
                        }

                        HStack {
                            Image("fat")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .saturation(0.4)
                            Text("\(String(format: "%.1f", intakeLogs.last!.fat)) g")
                                .font(.footnote)
                        }
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)

//                if !isPlatePage {
//                    NavigationLink { FoodPlate() } label: {
//                        Text("See Detail")
//                            .font(.headline)
//                            .fontWeight(.bold)
//                            .frame(maxWidth: .infinity)
//                            .padding(20)
//                            .foregroundStyle(.white)
//                            .background(.prime)
//                            .clipShape(RoundedRectangle(cornerRadius: 16))
//                    }
//                }

                if !isPlatePage{
                    Button(action: {
                        goToPlate = true
                    }) {
                        Text("See Detail")
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding(20)
                            .foregroundStyle(.white)
                            .background(intakeLogs.last!.plates.isEmpty ? .gray : .prime)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                    .disabled(intakeLogs.last!.plates.isEmpty)
                }
            }
            .sheet(isPresented: $goToPlate) {
                FoodPlate()
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, isPlatePage ? 16 : 32)
            .padding(.top, isPlatePage ? 23 : 34)
            .padding(.bottom, isPlatePage ? 16 : 44)
            .background(state[viewModel.character_mood]!.color)
            .clipShape(isPlatePage ? RoundedCorner(radius: 10) : RoundedCorner(radius: 32, corners: [.topLeft, .topRight]))
            .offset(y: 10)

            Image("cat_" + state[viewModel.character_mood]!.face)
                .scaleEffect(isPlatePage ? 0.9 : 1.1)
                .offset(x: UIScreen.main.bounds.width / 2 - (isPlatePage ? 90 : 70), y: isPlatePage ? -30 : -100)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: IntakeLog.self, DailyIntakeLog.self)
        return LogSummary()
            .environmentObject(FoodLogViewModel())
            .modelContainer(container)
    } catch {
        fatalError("Error log summary")
    }
}
