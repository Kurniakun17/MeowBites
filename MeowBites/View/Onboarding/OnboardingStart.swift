//
//  OnboardingStart.swift
//  MeowBites
//
//  Created by Dinda Ayu Syafitri on 26/06/24.
//

import SwiftData
import SwiftUI

struct OnboardingStart: View {
    @Environment(\.modelContext) private var context

    @Query var personalDatas: [UserPersonalData]
    @Query var bmrDatas: [BMRData]
    @Query var intakeLogs: [IntakeLog]
    @State var isPageOne = true

    @State var step = 1
    var body: some View {
        if (personalDatas.last?.isDoneOnboarding) != nil && (personalDatas.last?.isDoneOnboarding) == true {
            Home()
//                .onAppear {
//                    for data in personalDatas {
//                        context.delete(data)
//                    }
//
//                    for data in bmrDatas {
//                        context.delete(data)
//                    }
//                    
//                    for data in intakeLogs{
//                        context.delete(data)
//                    }
//                }
        } else {
            NavigationStack {
                GeometryReader {
                    geo in
                    ZStack(alignment: .topLeading) {
                        Image("grassBg")
                            .resizable()
                            .clipped()
                            .frame(width: geo.size.width, height: geo.size.height)

                        Image("onboard-cat-bigger")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                            .position(CGPoint(x: geo.size.width - 170, y: geo.size.height / 1.65))

                        VStack {
                            Spacer()
                            Circle()
                                .fill(.white)
                                .frame(width: geo.size.width * 4, height: geo.size.width * 4)
                                .offset(x: -((geo.size.width * 4) - geo.size.width) / 2, y: geo.size.height / 1.6)
                        }

                        VStack(spacing: 45) {
                            VStack(spacing: 16) {
                                Text("We need to know your Basal Metabolic Rate")
                                    .font(.system(size: 31))
                                    .bold()
                                    .multilineTextAlignment(.center)
                                Text("So, we can help you to stay mindful while enjoying your meal")
                                    .font(.body)
                                    .multilineTextAlignment(.center)
                            }
                            .padding(.horizontal, 32)
                            //                        Button(action: {
                            //                            for item in personalDatas {
                            //                                context.delete(item)
                            //                            }
                            //                            for item in bmrDatas {
                            //                                context.delete(item)
                            //                            }
                            //                        }, label: {
                            //                            Text("Delete Data")
                            //                        })

                            NavigationLink(destination: OnboardingPersonalData(step: $step), label: {
                                Text("Start calculate BMR")
                                    .font(.system(size: 24, weight: .bold))
                                    .padding(.vertical, 20)
                                    .frame(width: 326)
                                    .background(.prime)
                                    .foregroundStyle(Color.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            })
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        .offset(y: UIScreen.main.bounds.height - 320)
                    }
                    .ignoresSafeArea()
                }
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Plate.self, BMRData.self, UserPersonalData.self, FoodItem.self, configurations: config)

        return OnboardingStart()
            .modelContainer(container)
    } catch {
        fatalError("Error")
    }
}
