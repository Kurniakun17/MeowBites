//
//  OnboardingGenderSelect.swift
//  MeowBites
//
//  Created by Dinda Ayu Syafitri on 26/06/24.
//

import SwiftUI

struct OnboardingGenderSelect: View {
    @Binding var userGender: String
    @Binding var isDisabled: Bool

    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                VStack(spacing: 16) {
                    Text("Your Gender")
                        .font(.system(size: 19))
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 16)

                    HStack {
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                userGender = "male"
                                isDisabled = false
                            }
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.prime)
                                    .frame(width: 155, height: 155)
                                    .opacity(userGender != "male" ? 0 : 1)

                                RoundedRectangle(cornerRadius: 16)
                                    .fill(userGender == "male" ? .lightPurpleAccent : .lightDisableGrey)
                                    .frame(width: 145, height: 145)
                                    .overlay(alignment: .bottomLeading, content: {
                                        Image("male-cat-bigger")
                                            .resizable()
                                    })

                                Circle()
                                    .fill(.prime)
                                    .frame(width: 32)
                                    .overlay(alignment: .center, content: {
                                        Image(systemName: "checkmark")
                                            .foregroundStyle(.white)
                                    })
                                    .offset(y: -75)
                                    .opacity(userGender != "male" ? 0 : 1)
                            }
                        })

                        Spacer()
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                userGender = "female"
                                isDisabled = false
                            }
                        }, label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.redAccent)
                                    .frame(width: 155, height: 155)
                                    .opacity(userGender != "female" ? 0 : 1)

                                RoundedRectangle(cornerRadius: 16)
                                    .fill(userGender == "female" ? .lightRedAccent : .lightDisableGrey)
                                    .frame(width: 145, height: 145)
                                    .overlay(alignment: .bottomTrailing, content: {
                                        Image("female-cat-bigger")
                                            .resizable()
                                    })
                                Circle()
                                    .fill(.redAccent)
                                    .frame(width: 32)
                                    .overlay(alignment: .center, content: {
                                        Image(systemName: "checkmark")
                                            .foregroundStyle(.white)
                                    })
                                    .offset(y: -75)
                                    .opacity(userGender != "female" ? 0 : 1)
                            }
                        })
                    }
                }
                Spacer()
//
//                NavigationLink(destination: OnboardingAge(),
//                               label: {
//                                   Text("Next")
//                                       .font(.system(size: 24, weight: .bold))
//                                       .padding(.vertical, 20)
//                                       .frame(width: 326)
//                                       .background(isDisabled ? .lightDisableGrey : .prime)
//                                       .foregroundStyle(isDisabled ? Color.disableGrey : .white)
//                                       .clipShape(RoundedRectangle(cornerRadius: 16))
//                               })
//                               .disabled(isDisabled)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingGenderSelect(userGender: .constant(""), isDisabled: .constant(true))
}
