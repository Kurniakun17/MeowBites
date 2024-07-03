

//
//  HomeRevised.swift
//  DinoBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 24/06/24.
//
import SwiftData
import SwiftUI

struct Home: View {
    @Environment(\.modelContext) private var context
    @StateObject var viewModel = FoodLogViewModel()
    @Query var intakeLogs: [IntakeLog]
    @Query var dailyIntakeLogs: [DailyIntakeLog]
    var todayLog: DailyIntakeLog {
        return dailyIntakeLogs.last ?? DailyIntakeLog(Date: Date(), intakeLogs: [])
    }

    @Query var personalDatas: [UserPersonalData]
    @Query var bmrDatas: [BMRData]
    var bmrData: BMRData {
        return bmrDatas.first ?? BMRData(calorie: 2000.0, sugar: 50.0, salt: 50.0, fat: 50.0)
    }

    var caloriePercentage: Int {
        generatePercentage(type: "calorie")
    }

    var sugarPercentage: Int {
        generatePercentage(type: "sugar")
    }

    var saltPercentage: Int {
        generatePercentage(type: "salt")
    }

    var fatPercentage: Int {
        generatePercentage(type: "fat")
    }

    func generatePercentage(type: String) -> Int {
        switch type {
        case "calorie":
            if todayLog.calorie == 0.0 {
                return 1
            }

            return Int(todayLog.calorie / bmrData.calorie * 100)
        case "sugar":
            if todayLog.sugar == 0.0 {
                return 1
            }
            return Int(todayLog.sugar / bmrData.sugar * 100)

        case "salt":
            if todayLog.salt == 0.0 {
                return 1
            }
            return Int(todayLog.salt / bmrData.salt * 100)

        case "fat":
            if todayLog.fat == 0.0 {
                return 1
            }
            return Int(todayLog.fat / bmrData.calorie * 100)

        default:
            return 0
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Image("grassBg")
                    .scaleEffect(1.05)

                Image("cat1")
                    .shadow(color: .successBody, radius: 0, x: -16, y: 16)
                    .offset(x: 15, y: -140)

                VStack(spacing: 0) {
                    Spacer()

                    HStack(spacing: 20) {
                        NutritionBar(type: "calorie", percentage: caloriePercentage)
                        NutritionBar(type: "sugar", percentage: sugarPercentage)
                        NutritionBar(type: "salt", percentage: saltPercentage)
                        NutritionBar(type: "fat", percentage: fatPercentage)
                    }

                    .padding(.bottom, 12)

                    VStack(spacing: 14) {
                        HStack {
                            Image(systemName: "lightbulb.max.fill")
                                .foregroundStyle(.successBody)
                            Text("Happy mood, happy food, grab it!")
                                .foregroundStyle(.successBody)
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 20)
                        .background(.sucessBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                        HStack {
                            Button(action: {
                                for data in personalDatas {
                                    context.delete(data)
                                }

                                for data in bmrDatas {
                                    context.delete(data)
                                }

                                for data in intakeLogs {
                                    context.delete(data)
                                }

                                for dailyIntakeLog in dailyIntakeLogs {
                                    context.delete(dailyIntakeLog)
                                }
                            }) {
                                Text("Delete")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity)
                                    .padding(24)
                                    .foregroundStyle(.white)
                                    .background(.redSoft)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                        }
                        NavigationLink {
                            FoodLogging()
                        } label: {
                            Text("Eat")
                                .font(.title2)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity)
                                .padding(24)
                                .foregroundStyle(.white)
                                .background(.prime)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }

                        Text("Eat nicely to make miaw stay happy")
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 32)
                    .padding(.top, 34)
                    .padding(.bottom, 44)
                    .background(.white)
                    .clipShape(RoundedCorner(radius: 40, corners: [.topLeft, .topRight]))
                    .offset(y: 10)
                }
            }
            .onAppear {
                generateDailyIntake()
                generateEmptyLog()
            }
            .ignoresSafeArea()
        }
        .environmentObject(viewModel)
    }

    func getTodayLog() -> [IntakeLog] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let today = formatter.string(from: Date())

        let list = intakeLogs.filter { $0.isLogged && formatter.string(from: $0.date) == today }

        return list
    }

    func generateEmptyLog() {
//        If there is no unlogged intake, create a new one
        if intakeLogs.count > 0 && intakeLogs.last!.isLogged {
            context.insert(IntakeLog(Date: Date(), plates: []))
        } else if intakeLogs.isEmpty {
            context.insert(IntakeLog(Date: Date(), plates: []))
        }
    }

    func generateDailyIntake() {
//        If there is no todays log, create a new one
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let today = formatter.string(from: Date())

        if dailyIntakeLogs.count > 0 {
            let lastDate = formatter.string(from: dailyIntakeLogs.last!.date)
            if lastDate != today {
                context.insert(DailyIntakeLog(Date: Date(), intakeLogs: []))
            }
        } else {
            context.insert(DailyIntakeLog(Date: Date(), intakeLogs: []))
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Plate.self, BMRData.self, UserPersonalData.self, IntakeLog.self, FoodItem.self, DailyIntakeLog.self, configurations: config)
        return Home()
            .modelContainer(container)
    } catch {
        fatalError("Error home")
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
