//
//  PlateCardView.swift
//  MeowBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 26/06/24.
//

import SwiftUI

struct PlateCardView: View {
    var name: String
    var calorie: Double
    var sugar: Double
    var salt: Double
    var fat: Double
    var serving: Int
    var portion: Double
    var units: String

    var addServing: () -> Void
    var removeServing: () -> Void

    var body: some View {
        HStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 100, height: 100)

            VStack(alignment: .leading) {
                HStack {
                    Text(name)
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                    HStack {
                        Image("calorie")
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text("\(String(format: "%.0f", calorie)) cal")
                            .font(.footnote)
                    }
                }
                Text("\(String(format: "%.0f", portion)) g/\(units)")
                    .foregroundStyle(.gray)
                    .font(.footnote)
                HStack {
                    HStack {
                        Image("sugar")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .saturation(0.4)
                        Text("\(String(format: "%.1f", sugar)) g")
                            .font(.footnote)
                    }

                    HStack {
                        Image("salt")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .saturation(0.4)
                        Text("\(String(format: "%.1f", salt/1000)) g")
                            .font(.footnote)
                    }

                    HStack {
                        Image("fat")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .saturation(0.4)
                        Text("\(String(format: "%.1f", fat)) g")
                            .font(.footnote)
                    }
                }

                HStack(spacing: 36) {
                    Button(action: {
                        removeServing()
//                        serving -= 1
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
//                        serving += 1
                    }) {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                            .frame(width: 38, height: 38)
                            .background(.prime)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
        }
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(.semigray, lineWidth: 2))
    }
}

// #Preview {
//    PlateCardView(
//        name: "Nasi Goreng",
//        calorie: 200.0,
//        sugar: 200.0,
//        salt: 200.0,
//        fat: 200.0,
//        serving: (2),
//        addServing: {},
//        removeServing: {}
//    )
// }
