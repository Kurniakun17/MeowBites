//
//  OnboardingCatName.swift
//  MeowBites
//
//  Created by Dinda Ayu Syafitri on 27/06/24.
//

import SwiftUI

struct OnboardingCatName: View {
    var body: some View {
        NavigationStack {
            VStack(content: {
                ZStack {
                    Image("grassBg")
                }
            })
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingCatName()
}
