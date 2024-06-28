//
//  OnboardingDoneSet.swift
//  MeowBites
//
//  Created by Dinda Ayu Syafitri on 26/06/24.
//

import SwiftData
import SwiftUI

struct OnboardingDoneSet: View {
    @Environment(\.modelContext) var context
    @Query var BMRDatas: [BMRData]

    var BMRData: BMRData? {
        BMRDatas.first
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                VStack(spacing: 32) {
                    Text("You are Set!")
                        .font(.system(size: 31))
                        .bold()
                        .multilineTextAlignment(.center)

                    VStack(alignment: .leading, spacing: 16) {
                        Text("Your daily calorie need is")
                            .font(.body)

                        HStack(alignment: .center, spacing: 20) {
                            Image("cals-icon")
                                .frame(width: 66)
                            VStack(alignment: .leading) {
                                Text("\(formatValue(BMRData?.calorie ?? 0.0)) calories")
                                    .font(.system(size: 25))
                                    .bold()

                                Text("of calorie a day")
                                    .font(.body)
                            }
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                    }

                    VStack(alignment: .leading, spacing: 16) {
                        Text("Try to not exceed this")
                            .font(.body)

                        VStack(spacing: 32) {
                            HStack(alignment: .center, spacing: 20) {
                                Image("sugars-icon")
                                    .frame(width: 66)
                                VStack(alignment: .leading) {
                                    Text("\(formatValue(BMRData?.sugar ?? 0.0)) grams")
                                        .font(.system(size: 25))
                                        .bold()

                                    Text("of sugar a day")
                                        .font(.body)
                                }
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)

                            HStack(alignment: .center, spacing: 20) {
                                Image("salts-icon")
                                    .frame(width: 66)
                                VStack(alignment: .leading) {
                                    Text("5 grams")
                                        .font(.system(size: 25))
                                        .bold()

                                    Text("of salt a day")
                                        .font(.body)
                                }
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)

                            HStack(alignment: .center, spacing: 20) {
                                Image("fats-icon")
                                    .frame(width: 66)
                                VStack(alignment: .leading) {
                                    Text("\(formatValue(BMRData?.fat ?? 0.0)) grams")
                                        .font(.system(size: 25))
                                        .bold()

                                    Text("of fat a day")
                                        .font(.body)
                                }
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .frame(height: 350)

                    NavigationLink(destination: {}, label: {
                        Text("Eat")
                            .font(.system(size: 24, weight: .bold))
                            .padding(.vertical, 20)
                            .frame(width: 326)
                            .background(.prime)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    })
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .padding(.vertical, 72)
                .padding(.horizontal, 32)
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingDoneSet()
}
