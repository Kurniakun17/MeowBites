//
//  OnboardingHeightWeight.swift
//  MeowBites
//
//  Created by Dinda Ayu Syafitri on 26/06/24.
//

import SwiftUI

struct OnboardingHeightWeight: View {
    @Environment(\.dismiss) var dismiss

    @Binding var selectedHeight: Int
    @Binding var selectedWeight: Int

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
//                            .frame(width: 313, height: 12)
//
//                        HStack(spacing: 0) {
//                            ZStack(alignment: .center) {
//                                RoundedRectangle(cornerRadius: 12)
//                                    .fill(.secondaryPurple)
//                                    .frame(width: geo.size.width - 47, height: 12)
//
//                                RoundedRectangle(cornerRadius: 12)
//                                    .fill(.prime)
//                                    .frame(width: geo.size.width - 10 - 47, height: 5)
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
//                                Text("3")
//                                    .foregroundStyle(.white)
//                            }
//                            Spacer()
//                        }
//                        .frame(maxWidth: .infinity)
//                    }
//                }
//                .frame(height: 50)

                VStack(spacing: 16) {
                    Text("How tall are you?")
                        .font(.system(size: 19))
                        .bold()
                        .multilineTextAlignment(.center)

                    ZStack {
                        Rectangle()
                            .fill(.purplefade)
                            .frame(width: 135, height: 30)
                            .cornerRadius(5)

                        Picker("Age", selection: $selectedHeight) {
                            ForEach(0 ..< 200) { height in
                                HStack(spacing: 36) {
                                    Text("\(height)")
                                    Text("cm")
                                }
                                .foregroundStyle(.prime)
                                .fontWeight(.medium)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 150, height: 108)
                    }
                }

                VStack(spacing: 16) {
                    Text("How much do your weight?")
                        .font(.system(size: 19))
                        .bold()
                        .multilineTextAlignment(.center)

                    ZStack {
                        Rectangle()
                            .fill(.purplefade)
                            .frame(width: 135, height: 30)
                            .cornerRadius(5)

                        Picker("Weight", selection: $selectedWeight) {
                            ForEach(0 ..< 101) { weight in
                                HStack(spacing: 36) {
                                    Text("\(weight)")
                                    Text("kg")
                                }
                                .foregroundStyle(.prime)
                                .fontWeight(.medium)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 150, height: 108)
                    }
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingHeightWeight(selectedHeight: .constant(155), selectedWeight: .constant(40))
}
