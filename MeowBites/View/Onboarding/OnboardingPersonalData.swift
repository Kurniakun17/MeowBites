//
//  OnboardingPersonalData.swift
//  MeowBites
//
//  Created by Dinda Ayu Syafitri on 26/06/24.
//

import SwiftUI

struct OnboardingPersonalData: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss

    @State var step = 1
    @State var isDisabled = true
    @State var userGender = ""
    @State var selectedAge = 20
    @State var selectedHeight = 150
    @State var selectedWeight = 40

    func progressWidth(for step: Int, in geo: GeometryProxy) -> CGFloat {
        switch step {
        case 1:
            return 0
        case 2:
            return geo.size.width / 2 - 47
        case 3:
            return geo.size.width - 47
        default:
            return 0
        }
    }

    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                VStack(spacing: 32) {
                    Text("Tell us a little bit about yourself")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)

                    GeometryReader {
                        geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.purplefade)
                                .frame(width: 313, height: 12)

                            HStack(spacing: 0) {
                                ZStack(alignment: .center) {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.secondaryPurple)
                                        .frame(width: progressWidth(for: step, in: geo), height: 12)

                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.prime)
                                        .frame(width: progressWidth(for: step, in: geo) - 10, height: 5)
                                }

                                ZStack(alignment: .center) {
                                    Circle()
                                        .fill(.secondaryPurple)
                                        .frame(width: 12)
                                    Circle()
                                        .fill(.purplefade)
                                        .frame(width: 6)
                                    Circle()
                                        .fill(.prime)
                                        .frame(width: 4)
                                }

                                ZStack(alignment: .center) {
                                    Circle()
                                        .fill(.secondaryPurple)
                                        .frame(width: 35, height: 35)

                                    Circle()
                                        .fill(.prime)
                                        .frame(width: 25, height: 25)

                                    Text("\(step)")
                                        .foregroundStyle(.white)
                                }
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .frame(height: 50)

                    switch step {
                    case 1:
                        VStack {
                            OnboardingGenderSelect(userGender: $userGender, isDisabled: $isDisabled)
                                .frame(height: 350)

                            Button(action: {
                                step = 2
                                print(userGender)
                            }, label: {
                                Text("Next")
                                    .font(.system(size: 24, weight: .bold))
                                    .padding(.vertical, 20)
                                    .frame(width: 326)
                                    .background(isDisabled ? .lightDisableGrey : .prime)
                                    .foregroundStyle(isDisabled ? Color.disableGrey : .white)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            })
                            .disabled(isDisabled)
                        }

                    case 2:
                        VStack {
                            OnboardingAge(selectedAge: $selectedAge)
                                .frame(height: 350)

                            HStack {
                                Button(action: {
                                    step = 1
                                }, label: {
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

                                Button(action: {
                                    step = 3
                                    print(selectedAge)
                                }, label: {
                                    Text("Next")
                                        .font(.system(size: 24, weight: .bold))
                                        .padding(.vertical, 20)
                                        .frame(width: 239)
                                        .background(.prime)
                                        .foregroundStyle(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 16))
                                })
                            }
                        }

                    case 3:
                        VStack {
                            OnboardingHeightWeight(selectedHeight: $selectedHeight, selectedWeight: $selectedWeight).frame(height: 350)

                            HStack {
                                Button(action: {
                                    step = 2
                                }, label: {
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

                                Button(action: {
                                    context.insert(UserPersonalData(gender: userGender, age: selectedAge, weight: selectedWeight, height: selectedHeight))
                                }, label: {
                                    Text("Done")
                                        .font(.system(size: 24, weight: .bold))
                                        .padding(.vertical, 20)
                                        .frame(width: 239)
                                        .background(.prime)
                                        .foregroundStyle(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 16))
                                })
                            }
                        }

                    default:
                        VStack {
                            OnboardingGenderSelect(userGender: $userGender, isDisabled: $isDisabled).frame(height: 350)
                            Button(action: {
                                step = 2
                                print(userGender)
                            }, label: {
                                Text("Next")
                                    .font(.system(size: 24, weight: .bold))
                                    .padding(.vertical, 20)
                                    .frame(width: 326)
                                    .background(isDisabled ? .lightDisableGrey : .prime)
                                    .foregroundStyle(isDisabled ? Color.disableGrey : .white)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            })
                            .disabled(isDisabled)
                        }
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
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingPersonalData()
}
