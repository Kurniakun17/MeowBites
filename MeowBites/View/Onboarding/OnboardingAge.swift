//
//  OnboardingAge.swift
//  MeowBites
//
//  Created by Dinda Ayu Syafitri on 26/06/24.
//

import SwiftUI

struct OnboardingAge: View {
    @Environment(\.dismiss) var dismiss

    @Binding var selectedAge: Int

    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
//                Text("Tell us a little bit about yourself")
//                    .font(.largeTitle)
//                    .fontWeight(.semibold)
//                    .multilineTextAlignment(.leading)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .fixedSize(horizontal: false, vertical: true)
//
//                GeometryReader {
//                    geo in
//                    ZStack(alignment: .leading) {
//                        RoundedRectangle(cornerRadius: 12)
//                            .fill(.purplefade)
//                            .frame(width: .infinity, height: 12)
//
//                        HStack(spacing: 0) {
//                            ZStack(alignment: .center) {
//                                RoundedRectangle(cornerRadius: 12)
//                                    .fill(.secondaryPurple)
//                                    .frame(width: geo.size.width / 2 - 47, height: 12)
//
//                                RoundedRectangle(cornerRadius: 12)
//                                    .fill(.prime)
//                                    .frame(width: geo.size.width / 2 - 10 - 47, height: 5)
//                            }
//
//                            ZStack(alignment: .center) {
//                                Circle()
//                                    .fill(.secondaryPurple)
//                                    .frame(width: 12)
//                                Circle()
//                                    .fill(.purplefade)
//                                    .frame(width: 6)
//                                Circle()
//                                    .fill(.prime)
//                                    .frame(width: 4)
//                            }
//
//                            ZStack(alignment: .center) {
//                                Circle()
//                                    .fill(.secondaryPurple)
//                                    .frame(width: 35, height: 35)
//
//                                Circle()
//                                    .fill(.prime)
//                                    .frame(width: 25, height: 25)
//
//                                Text("2")
//                                    .foregroundStyle(.white)
//                            }
//                            Spacer()
//                        }
//                        .frame(maxWidth: .infinity)
//                    }
//                }
//                .frame(height: 50)

                VStack(spacing: 16) {
                    Text("How old are you?")
                        .font(.system(size: 19))
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 16)

                    ZStack {
                        Rectangle()
                            .fill(.purplefade)
                            .frame(width: 310, height: 30)
                            .cornerRadius(5)

                        Picker("Age", selection: $selectedAge) {
                            ForEach(0 ..< 101) { age in
                                HStack(spacing: 36) {
                                    Text("\(age)")
                                    Text("Years Old")
                                }
                                .foregroundStyle(.prime)
                                .fontWeight(.medium)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(height: 200)
                    }
                }
                Spacer()
//                .padding(.bottom, 110)

//                HStack {
//                    Button(action: {
//                        dismiss()
//                    }, label: {
//                        RoundedRectangle(cornerRadius: 16)
//                            .fill(.white)
//                            .stroke(.prime, style: StrokeStyle(lineWidth: 2))
//                            .frame(width: 68, height: 68)
//                            .overlay(content: {
//                                Image(systemName: "chevron.left")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 13)
//                                    .foregroundStyle(.prime)
//
//                            })
//                    })
//
//                    NavigationLink(destination: {},
//                                   label: {
//                                       Text("Next")
//                                           .font(.system(size: 24, weight: .bold))
//                                           .padding(.vertical, 20)
//                                           .frame(width: 239)
//                                           .background(.prime)
//                                           .foregroundStyle(.white)
//                                           .clipShape(RoundedRectangle(cornerRadius: 16))
//                                   })
//                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingAge(selectedAge: .constant(20))
}
