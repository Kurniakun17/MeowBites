//
//  OnboardingExerciseSelect.swift
//  MeowBites
//
//  Created by Dinda Ayu Syafitri on 26/06/24.
//

import SwiftUI

struct OnboardingExerciseSelect: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss

    @Binding var userPersonalData: UserPersonalData

    @State var isDisabled = true
    @State var exerciseRate = ""

    @State var backToStep = 3
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                VStack(spacing: 67) {
                    VStack(spacing: 10) {
                        Button(action: {
                            exerciseRate = "no"
                            isDisabled = false
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.prime)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .opacity(exerciseRate == "no" ? 1 : 0)

                                VStack(alignment: .leading) {
                                    Text("No exercise")
                                        .font(.system(size: 19))
                                        .bold()
                                    Text("sedentary")
                                        .font(.body)
                                }
                                .padding(16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(exerciseRate == "no" ? .secondaryPurple : .lightDisableGrey)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(5)
                            }
                        })
                        .buttonStyle(PlainButtonStyle())

                        Button(action: {
                            exerciseRate = "light"
                            isDisabled = false
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.prime)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .opacity(exerciseRate == "light" ? 1 : 0)

                                VStack(alignment: .leading) {
                                    Text("Light exercise")
                                        .font(.system(size: 19))
                                        .bold()
                                    Text("1-3 per week")
                                        .font(.body)
                                }
                                .padding(16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(exerciseRate == "light" ? .secondaryPurple : .lightDisableGrey)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(5)
                            }
                        })
                        .buttonStyle(PlainButtonStyle())

                        Button(action: {
                            exerciseRate = "moderate"
                            isDisabled = false
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.prime)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .opacity(exerciseRate == "moderate" ? 1 : 0)

                                VStack(alignment: .leading) {
                                    Text("Moderate exercise")
                                        .font(.system(size: 19))
                                        .bold()
                                    Text("4-5 per week")
                                        .font(.body)
                                }
                                .padding(16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(exerciseRate == "moderate" ? .secondaryPurple : .lightDisableGrey)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(5)
                            }
                        })
                        .buttonStyle(PlainButtonStyle())

                        Button(action: {
                            exerciseRate = "intense"
                            isDisabled = false
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.prime)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .opacity(exerciseRate == "intense" ? 1 : 0)

                                VStack(alignment: .leading) {
                                    Text("Intense exercise")
                                        .font(.system(size: 19))
                                        .bold()
                                    Text("4-5 per week")
                                        .font(.body)
                                }
                                .padding(16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(exerciseRate == "intense" ? .secondaryPurple : .lightDisableGrey)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(5)
                            }
                        })
                        .buttonStyle(PlainButtonStyle())

                        Button(action: {
                            exerciseRate = "veryIntense"
                            isDisabled = false
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.prime)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .opacity(exerciseRate == "veryIntense" ? 1 : 0)

                                VStack(alignment: .leading) {
                                    Text("Very intense exercise")
                                        .font(.system(size: 19))
                                        .bold()
                                    Text("6-7 per week")
                                        .font(.body)
                                }
                                .padding(16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(exerciseRate == "veryIntense" ? .secondaryPurple : .lightDisableGrey)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(5)
                            }
                        })
                        .buttonStyle(PlainButtonStyle())

                        Button(action: {
                            exerciseRate = "extraIntense"
                            isDisabled = false
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.prime)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .opacity(exerciseRate == "extraIntense" ? 1 : 0)

                                VStack(alignment: .leading) {
                                    Text("Extra Intense exercise")
                                        .font(.system(size: 19))
                                        .bold()
                                    Text("Twice per day")
                                        .font(.body)
                                }
                                .padding(16)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(exerciseRate == "extraIntense" ? .secondaryPurple : .lightDisableGrey)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(5)
                            }
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                    .frame(height: 494)

                    HStack {
                        NavigationLink(destination: OnboardingPersonalData(step: $backToStep), label: {
                            Button(action: {}, label: {
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.white)
                                    .stroke(.prime, style: StrokeStyle(lineWidth: 2))
                                    .frame(width: 68, height: 68)
                                    .overlay(content: {
                                        Image(systemName: "chevron.left")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 13)
                                            .foregroundStyle(.prime)

                                    })
                            })
                        })

                        Button(action: {
                            userPersonalData.exerciseRate = exerciseRate
                            context.insert(userPersonalData)
                        }, label: {
                            Text("Calculate")
                                .font(.system(size: 24, weight: .bold))
                                .padding(.vertical, 20)
                                .frame(width: 239)
                                .background(isDisabled ? .lightDisableGrey : .prime)
                                .foregroundStyle(isDisabled ? .disableGrey : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        })

//                        NavigationLink(destination: OnboardingDoneSet(), label: {
//                            Button(action: {
//                                //                        step = 3
//                                //                        print(selectedAge)
//                            }, label: {
//                                Text("Calculate")
//                                    .font(.system(size: 24, weight: .bold))
//                                    .padding(.vertical, 20)
//                                    .frame(width: 239)
//                                    .background(isDisabled ? .lightDisableGrey : .prime)
//                                    .foregroundStyle(isDisabled ? .disableGrey : .white)
//                                    .clipShape(RoundedRectangle(cornerRadius: 16))
//                            })
//                            .disabled(isDisabled)
//                        })
                        .disabled(isDisabled)
                    }
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
            .onAppear {
                print(userPersonalData.gender)
            }
        }
    }
}

// #Preview {
//    OnboardingExerciseSelect()
// }
