//
//  FoodDiary.swift
//  MeowBites
//
//  Created by Elsavira T on 26/06/24.
//

import SwiftUI

struct FoodDiary: View {
    var body: some View {
        VStack {
            HStack {
                Image("backbutton")
                    .frame(width: 100)
                Spacer()
                
                Text("Food Diary")
                    .font(.title2).bold()
                    .padding(.trailing, 140)
            }
            HStack {
                Image("buttontoday")
                Spacer()
                    .frame(width: 13)
                Image("calendar")
            }
            Spacer()
                .frame(height: 24)
            ZStack {
                VStack {
                    HStack {
                        Image("greencircle")
                        Text("200 kcal remaining")
                            .font(.title2).bold()
                    }
                    Text("calorie intake: 0 kcal")
                        .font(.footnote)
                        .foregroundColor(.black.opacity(0.4))
                    Image("calbar1")
                        .padding(.top, 16)

                }
                .padding(20)
                .background((Color(red: 0.8, green: 0.94, blue: 0.75)))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            HStack (spacing: 32) {
                VStack {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 56, height: 56)
                        Image("sugarlogo")
                    }
                    Text("0 g / 5 g")
                        .font(.callout)
                    Text("Sugar")
                        .font(.callout)
                }
                VStack {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 56, height: 56)
                        Image("saltlogo")
                    }
                    Text("0 g / 5 g")
                        .font(.callout)
                    Text("Salt")
                        .font(.callout)
                }
                VStack {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 56, height: 56)
                        Image("fatlogo")
                    }
                    Text("0 g / 5 g")
                        .font(.callout)
                    Text("Fat")
                        .font(.callout)
                }
            }
            .padding(.bottom, 32)
            
            
            Text("Foods Eaten")
                .font(.title2).bold()
                .frame(width: 325, height: 24, alignment: .topLeading)
            
            List {
                HStack {
                    Text("Foods")
                        .font(.headline)
                        .frame(width: 175, alignment: .leading)
                    Text("Times Eaten")
                        .font(.headline)
                        .frame(width: 67)
                    Text("Times (kcal)")
                        .font(.headline)
                        .frame(width: 67)
                }
                HStack {
                    Text("KFC Dada Ayam")
                        .frame(width: 175, alignment: .leading)
                    Text("2x")
                        .frame(width: 67)
                    Text("1040")
                        .frame(width: 67)
                }
                HStack {
                    Text("Ayam Goreng")
                        .frame(width: 175, alignment: .leading)
                    Text("1x")
                        .frame(width: 67)
                    Text("260")
                        .frame(width: 67)
                }
                HStack {
                    Text("Solaria Nasi Goreng")
                        .frame(width: 175, alignment: .leading)
                    Text("2x")
                        .frame(width: 67)
                    Text("168")
                        .frame(width: 67)
                }
                HStack {
                    Text("Solaria Nasi Goreng")
                        .frame(width: 175, alignment: .leading)
                    Text("2x")
                        .frame(width: 67)
                    Text("168")
                        .frame(width: 67)
                }
                HStack {
                    Text("Total")
                        .font(.headline)
                        .frame(width: 175, alignment: .leading)
                    Text("4x")
                        .font(.headline)
                        .frame(width: 67)
                    Text("1468")
                        .font(.headline)
                        .frame(width: 67)
                }
            }
            .listStyle(.plain)
            .padding(.horizontal)
        }
    }
}

#Preview {
    FoodDiary()
}
