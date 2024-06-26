//
//  FoodCardView.swift
//  DinoBites
//
//  Created by Kurnia Kharisma Agung Samiadjie on 23/06/24.
//

import SwiftUI

struct FoodCardView: View {
    @EnvironmentObject var viewModel: FoodLogViewModel
    var id: Int
    var name: String
    var portion: Double
    var units: String
    var calorie: Double
    var serving = 0
    var addServing: () -> Void
    var removeServing: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            NavigationLink(destination: {
                FoodDetail(id: id)
            }) {
                HStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .padding(.bottom, 4)
            }

            VStack(alignment: .leading) {
                NavigationLink(destination: { FoodDetail(id: id) }) {
                    VStack(alignment: .leading) {
                        Text(name)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)

                        HStack(spacing: 4) {
                            Image("calorie")
                                .resizable()
                                .frame(width: 16, height: 16)
                            Text(String(calorie) + " calories")
                                .fontWeight(.bold)
                                .font(.caption)
                        }

                        Text("\(String(format: "%.0f", portion))g / \(units)")
                            .fontWeight(.bold)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }

                if serving == 0 {
                    Button(action: {
                        addServing()
                    }) {
                        Text("add")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding(8)
                            .padding(.vertical, 1)
                            .font(.callout)
                            .foregroundStyle(.white)
                            .background(.prime)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                else {
                    HStack {
                        Button(action: {
                            removeServing()
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
    FoodCardView(id: 1, name: "Nasi Goreng", portion: 150.0, units: "Serving", calorie: 230.0, addServing: {}, removeServing: {})
}
