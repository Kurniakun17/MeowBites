//
//  LogSummary.swift
//  DinoBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 25/06/24.
//

import SwiftUI

struct StateItem {
    let title: String
    let color: Color
    let face: String // You can use an enum or symbol system for faces if needed
}

// Define a dictionary to hold the states
let state: [String: StateItem] = [
    "good": StateItem(title: "Good Choice", color: Color.greenSoft, face: "happy"),
    "warning": StateItem(title: "The fat is high!", color: Color.orangeSoft, face: "sad"),
    "danger": StateItem(title: "You take too much calorie", color: Color.danger, face: "dizzy")
]

struct LogSummary: View {
    var character: String = "good"

    var body: some View {
        ZStack {
            VStack(spacing: 14) {
                VStack {
                    Text(state[character]!.title)
                        .foregroundStyle(.black)
                        .font(.title2)
                        .fontWeight(.bold)
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
                            Text("1,062 kcal")
                                .font(.footnote)
                        }

                        HStack {
                            Image("sugar")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .saturation(0.4)
                            Text("34.9 g")
                                .font(.footnote)
                        }

                        HStack {
                            Image("salt")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .saturation(0.4)
                            Text("3.7 g")
                                .font(.footnote)
                        }

                        HStack {
                            Image("fat")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .saturation(0.4)
                            Text("2 g")
                                .font(.footnote)
                        }
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)

                NavigationLink { FoodLogging() } label: {
                    Text("See Detail")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding(24)
                        .foregroundStyle(.white)
                        .background(.prime)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 32)
            .padding(.top, 34)
            .padding(.bottom, 44)
            .background(state[character]!.color)
            .clipShape(RoundedCorner(radius: 40, corners: [.topLeft, .topRight]))
            .offset(y: 10)

            Image("cat_" + state[character]!.face)
                .scaleEffect(1.1)
                .offset(x: UIScreen.main.bounds.width / 2 - 70, y: -100)
        }
    }
}

#Preview {
    LogSummary(character: "good")
}
