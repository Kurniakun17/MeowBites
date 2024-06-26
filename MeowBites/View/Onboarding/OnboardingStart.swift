//
//  OnboardingStart.swift
//  MeowBites
//
//  Created by Dinda Ayu Syafitri on 26/06/24.
//

import SwiftData
import SwiftUI

struct OnboardingStart: View {
    @State var isPageOne = true

    var body: some View {
        NavigationStack {
            GeometryReader {
                geo in
                ZStack(alignment: .topLeading) {
                    Image("grassBg")
                        .resizable()
                        .clipped()
                        .frame(width: geo.size.width, height: geo.size.height)

                    Image("onboard-cat-1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350)
                        .position(CGPoint(x: geo.size.width - 170, y: geo.size.height / 1.65))

                    VStack {
                        Spacer()
                        Circle()
                            .fill(.white)
                            .frame(width: geo.size.width * 4, height: geo.size.width * 4)
                            .offset(x: -((geo.size.width * 4) - geo.size.width) / 2, y: geo.size.height / 1.6)
                    }

                    VStack(spacing: 45) {
                        VStack(spacing: 16) {
                            Text("We need to know your Basal Metabolic Rate")
                                .font(.system(size: 31))
                                .bold()
                                .multilineTextAlignment(.center)
                            Text("So, we can help you to stay mindful while enjoying your meal")
                                .font(.body)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.horizontal, 32)

                        NavigationLink(destination: OnboardingPersonalData(), label: {
                            Text("Start calculate BMR")
                                .font(.system(size: 24, weight: .bold))
                                .padding(.vertical, 20)
                                .frame(width: 326)
                                .background(.prime)
                                .foregroundStyle(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        })
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .offset(y: UIScreen.main.bounds.height - 320)
                }
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    OnboardingStart()
}
