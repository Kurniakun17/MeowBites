//
//  FoodCardView.swift
//  DinoBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 23/06/24.
//

import SwiftUI

struct FoodCardView: View {
    var name: String
    var portion: Double
    var units: String
    var calorie: Double

    @State private var serving = 0

    func addServing() {
        serving += 1
        print(serving)
    }

    func removeServing() {
        if serving > 0 {
            serving -= 1
            print(serving)
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                RoundedRectangle(cornerRadius: 12)
                    .frame(maxWidth: .infinity, maxHeight: 100)
            }
            .padding(.bottom, 4)

            VStack(alignment: .leading) {
                Text(name)
                    .font(.subheadline)
                    .fontWeight(.bold)

                HStack(spacing: 4) {
                    Image("calorie")
                        .resizable()
                        .frame(width: 16, height: 16)
                    Text(String(calorie) + " calories")
                        .fontWeight(.bold)
                        .font(.caption)
                }

                Text("\(portion)g / \(units)")
                    .fontWeight(.bold)
                    .font(.caption)
                    .foregroundStyle(.gray)

                if serving == 0 {
                    Button(action: {
                        addServing()
                        //                        serving += 1
                    }) {
                        Text("Add")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .foregroundStyle(.white)
                            .background(.prime)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                else {
                    HStack {
                        Button(action: {
                            removeServing()
                            //                            serving -= 1
                        }) {
                            Image(systemName: "minus")
                                .foregroundStyle(.white)
                                .frame(width: 38, height: 38)
                                .background(.prime)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }

                        Spacer()

                        Text(String(serving))
                            .font(.subheadline)
                            .fontWeight(.semibold)

                        Spacer()

                        Button(action: {
                            addServing()
                            //                            serving += 1
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
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(0)
        }
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(.gray, lineWidth: 0.5))
    }
}

#Preview {
    FoodCardView(name: "Nasi Goreng", portion: 150.0, units: "Serving", calorie: 230.0)
}
