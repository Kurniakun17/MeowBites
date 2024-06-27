//
//  OnboardingCatName.swift
//  MeowBites
//
//  Created by Dinda Ayu Syafitri on 27/06/24.
//

import SwiftUI

struct OnboardingCatName: View {
    @Environment(\.modelContext) var context
    @StateObject var viewModel = UserCatViewModel()

    @State private var inputName = ""

    var body: some View {
        NavigationStack {
            VStack(content: {
                ZStack {
                    Image("grassBg")

                    Image("main-cat-bigger")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 230)
                        .padding(.bottom, 200)

                    VStack {
                        Spacer()
                        VStack {
                            Text("Give name for the cat")
                                .font(.system(size: 19))
                                .bold()

                            HStack {
                                TextField("Name your cat", text: $inputName)
                                    .textFieldStyle(.roundedBorder)

                                NavigationLink(destination: {}, label: {
                                    Image(systemName: "pencil.line")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .padding(15)
                                        .background(.prime)
                                        .clipShape(RoundedRectangle(cornerRadius: 16))
                                        .foregroundStyle(.white)
                                })
//                                Button(action: {
//                                    viewModel.addCatName(context: context, catName: UserCat(name: inputName))
//                                }, label: {
//
//                                })
                            }
                            Text("You can rename it later")
                                .font(.system(size: 16))
                                .foregroundStyle(.disableGrey)
                        }
                        .padding(32)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
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
