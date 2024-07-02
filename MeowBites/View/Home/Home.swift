

//
//  HomeRevised.swift
//  DinoBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 24/06/24.
//
import SwiftData
import SwiftUI

struct Home: View {
    @StateObject var viewModel = FoodLogViewModel()
    @Query var intakeLogs: [IntakeLog]
    @Query var personalDatas: [UserPersonalData]
    @Query var bmrDatas: [BMRData]

    var todayLog: [IntakeLog] {
        return getTodayLog()
    }

    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {}.frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
                .background(.sucessBackground)

                Image("background")
                    .scaleEffect(1.05)

                Image("cat1")
                    .shadow(color: .successBody, radius: 0, x: -16, y: 16)
                    .offset(x: 15, y: -100)

                VStack(spacing: 0) {
                    Spacer()

                    HStack(spacing: 20) {
                        NutritionBar(type: "calorie", percentage: 20)
                        NutritionBar(type: "sugar", percentage: 120)
                        NutritionBar(type: "salt", percentage: 90)
                        NutritionBar(type: "fat", percentage: 70)
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
                generateTodayLog()
                print(intakeLogs.last?.isLogged ?? "null")
            }
            .onChange(of: intakeLogs) {
                print(getTodayLog())
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

    func generateTodayLog() {
        if intakeLogs.count > 0 {
            if intakeLogs.last!.isLogged {
                context.insert(IntakeLog(Date: Date(), plates: []))
            }
        } else {
            context.insert(IntakeLog(Date: Date(), plates: []))
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Plate.self, BMRData.self, UserPersonalData.self, IntakeLog.self, FoodItem.self, configurations: config)
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
