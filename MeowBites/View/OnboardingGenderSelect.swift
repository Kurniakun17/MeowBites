//
//  OnboardingGenderSelect.swift
//  MeowBites
//
//  Created by Dinda Ayu Syafitri on 26/06/24.
//

import SwiftUI

struct OnboardingGenderSelect: View {
    @State var isDisabled = true
    @State var userGender = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Text("Tell us a little bit about yourself")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)

                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.purplefade)
                        .frame(width: .infinity, height: 12)

                    HStack(spacing: 0) {
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

                            Text("1")
                                .foregroundStyle(.white)
                        }
                    }
                }

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
                                        Image("male-cat")
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
                                        Image("female-cat")
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
                .padding(.bottom, 136)

                NavigationLink(destination: OnboardingAge(),
                               label: {
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
            .padding(.vertical, 72)
            .padding(.horizontal, 32)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingGenderSelect()
}
