//
//  cobaProfile.swift
//  MeowBites
//
//  Created by Elsavira T on 01/07/24.
//

import SwiftUI

struct cobaProfile: View {
    @Binding var inputName: String
    @Binding var inputAge: String
    @Binding var inputHeight: String
    @Binding var inputWeight: String
    @Binding var inputType: String
    var genders = ["Male", "Female"]
    @State private var selectedGender = "Male"
    var exercises = ["No Exercise", "Light", "Heavy"]
    @State private var selectedExercise = "No Exercise"
    
    var body: some View {
        ZStack {
            VStack {
                Image("grass")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            .ignoresSafeArea()
            ZStack {
                VStack {
                    Text("Calorie need")
                        .foregroundColor(Color(red: 0.55, green: 0.58, blue: 0.67))
                        .font(.callout)
                        .frame(width: 325, height: 24, alignment: .leading)
                    Rectangle()
                        .fill(Color(red: 0.98, green: 0.82, blue: 0.82))
                        .frame(width: 325, height: 48, alignment: .center)
                        .cornerRadius(16)
                        .overlay(alignment: .center, content: {
                            HStack {
                                Image("calorie")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                                Text("1978 calories")
                                    .frame(width: 260, height: 24, alignment: .leading)
                                    .font(.callout)
                            }
                        })
                        .padding(.bottom, 20)
                    
                    
                    VStack(alignment: .leading, spacing: 0) {
                        
                        List {
                            Section(header: Text("Maximum nutrient need")) {
                                HStack {
                                    Image("sugarlogo")
                                        .frame(width: 16, height: 16)
                                    Spacer()
                                        .frame(width: 14)
                                    Text("148 of sugar")
                                }
                                HStack {
                                    Image("saltlogo")
                                        .frame(width: 16, height: 16)
                                    Spacer()
                                        .frame(width: 14)
                                    Text("5g of salt")
                                }
                                HStack {
                                    Image("fatlogo")
                                        .frame(width: 16, height: 16)
                                    Spacer()
                                        .frame(width: 14)
                                    Text("66g of fat")
                                }
                            }
                        }
                        .scrollContentBackground(.hidden)
                        .frame(height: 200)
                        
                    }
                    .background(.white)
                    
                    Form() {
                        Section(header: Text("personal information")) {
                            VStack(spacing: 20) {
                                LabeledContent {
                                    TextField("Name", text: $inputName)
                                        .multilineTextAlignment(.trailing)
                                } label: {
                                    HStack{
                                        Text("Name")
                                    }
                                }
                                LabeledContent {
                                    Picker("", selection: $selectedGender)
                                    {
                                        ForEach(genders, id: \.self) {
                                            Text($0)
                                        }
                                    }
                                    .pickerStyle(NavigationLinkPickerStyle())
                                }label: {
                                    HStack{
                                        Text("Gender")
                                    }
                                }
                                
                                LabeledContent {
                                    TextField("Age", text: $inputAge)
                                        .multilineTextAlignment(.trailing)
                                } label: {
                                    HStack {
                                        Text("Age")
                                    }
                                }
                                
                                LabeledContent {
                                    TextField("Height", text: $inputHeight)
                                        .multilineTextAlignment(.trailing)
                                } label: {
                                    HStack {
                                        Text("Height")
                                    }
                                }
                                
                                LabeledContent {
                                    TextField("Weight", text: $inputWeight)
                                        .multilineTextAlignment(.trailing)
                                } label: {
                                    HStack {
                                        Text("Weight")
                                    }
                                }
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                    Spacer()
                    
                    Form() {
                        Section(header: Text("exercise")) {
                            VStack(spacing: 20) {
                                LabeledContent {
                                    Picker("", selection: $selectedExercise)
                                    {
                                        ForEach(exercises, id: \.self) {
                                            Text($0)
                                        }
                                    }
                                    .pickerStyle(NavigationLinkPickerStyle())
                                }label: {
                                    HStack{
                                        Text("Type")
                                    }
                                }
                            }
                        }
                    }
                }
                Spacer()
                VStack {
                    Image("back")
                        .frame(width: 326, height: 100, alignment: .leading)
                    
                    Image("frame1")
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    cobaProfile(inputName: .constant("Meow"), inputAge: .constant("27"), inputHeight: .constant("172"), inputWeight: .constant("59"), inputType: .constant("test"))
}
