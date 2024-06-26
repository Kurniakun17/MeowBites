//
//  Profile.swift
//  MeowBites
//
//  Created by Elsavira T on 26/06/24.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack {
            ZStack {
                Image("grass")
                    .resizable()
                    .scaledToFill()
                    .padding(.top, 70)
                
                HStack {
                    Image("back")
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
            }
            
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: .infinity)
                    .background(.white)
                    .cornerRadius(30)
                    .offset(y: -30)
                
                Image("frame1")
                    .offset(y:-90)
                    .padding(.bottom, 32)
                Image("namebutton")
                    .padding(.bottom, 120)
                
            }
            
            VStack {
                Text("Nutrient Goals")
                    .font(.title2).bold()
                    .frame(width: 325, height: 24, alignment: .topLeading)
                    .padding(.bottom, 16)
                
                Rectangle()
                    .fill(Color(red: 1, green: 0.72, blue: 0))
                    .frame(width: 325, height: 158, alignment: .center)
                    .cornerRadius(16)
                    .overlay(alignment: .center, content: {
                        HStack (spacing: 20){
                            VStack(alignment: .center) {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 56, height: 56)
                                    .padding(.bottom, 16)
                                Text("1400")
                                    .font(Font.custom("SF Pro", size: 14)
                                        .weight(.medium)
                                    )
                                Text("kcal")
                                    .frame(width: 40, alignment: .center)
                                    .font(Font.custom("SF Pro", size: 14)
                                        .weight(.medium)
                                    )
                            }
                            VStack(alignment: .center) {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 56, height: 56)
                                    .padding(.bottom, 16)
                                Text("5 g")
                                    .font(Font.custom("SF Pro", size: 14)
                                        .weight(.medium)
                                    )
                                Text("Sugar")
                                    .frame(width: 40, alignment: .center)
                                    .font(Font.custom("SF Pro", size: 14)
                                        .weight(.medium)
                                    )
                            }
                            VStack(alignment: .center) {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 56, height: 56)
                                    .padding(.bottom, 16)
                                Text("5 g")
                                    .font(Font.custom("SF Pro", size: 14)
                                        .weight(.medium)
                                    )
                                Text("Salt")
                                    .frame(width: 40, alignment: .center)
                                    .font(Font.custom("SF Pro", size: 14)
                                        .weight(.medium)
                                    )
                            }
                            VStack(alignment: .center) {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 56, height: 56)
                                    .padding(.bottom, 16)
                                Text("5 g")
                                    .font(.caption)
                                    .font(Font.custom("SF Pro", size: 14)
                                        .weight(.medium)
                                    )
                                Text("Fat")
                                    .frame(width: 40, alignment: .center)
                                    .font(Font.custom("SF Pro", size: 14)
                                        .weight(.medium)
                                    )
                            }
                            
                        }
                    })
                    .padding(.bottom, 32)
                
                
                Text("Personal Information")
                    .font(.title2).bold()
                    .frame(width: 325, height: 24, alignment: .topLeading)
                    .padding(.bottom, 16)
                
                HStack (spacing: 15){
                    VStack(alignment: .leading) {
                        Text("Gender")
                            .font(.headline)
                        Text("Male")
                            .frame(width: 70, alignment: .leading)
                    }
                    VStack(alignment: .leading) {
                        Text("Age")
                            .font(.headline)
                        Text("27 yo")
                            .frame(width: 70, alignment: .leading)
                    }
                    VStack(alignment: .leading) {
                        Text("Height")
                            .font(.headline)
                        Text("159 cm")
                            .frame(width: 70, alignment: .leading)
                    }
                    VStack(alignment: .leading) {
                        Text("Weight")
                            .font(.headline)
                        Text("58 kg")
                            .frame(width: 70, alignment: .leading)
                    }
                }
                .padding(.bottom, 32)
                Image("editbutton")
                    .padding(.bottom, 50)
            }
            .offset(y:-100)
        }
    }
}

#Preview {
    Profile()
}
