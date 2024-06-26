//
//  Profile.swift
//  MeowBites
//
//  Created by Elsavira T on 26/06/24.
//

import SwiftUI

struct Profile: View {
    @Binding var inputName: String
    @Binding var inputAge: String
    @Binding var inputHeight: String
    @Binding var inputWeight: String
    @Binding var inputType: String
    
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
            }
            
            VStack {
                Text("Profile")
                    .font(.largeTitle).bold()
                    .frame(width: 325, height: 24, alignment: .center)
                    .padding(.bottom, 16)
                
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
                
                Text("Maximum nutrient need")
                    .foregroundColor(Color(red: 0.55, green: 0.58, blue: 0.67))
                    .font(.callout)
                    .frame(width: 325, height: 24, alignment: .leading)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                        .frame(width: 326, height: 96)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(red: 0.86, green: 0.87, blue: 0.88), lineWidth: 1))
                    VStack {
                        HStack {
                            Image("calorie")
                                .resizable()
                                .frame(width: 16, height: 16)
                            Text("1978 calories")
                                .frame(width: 260, height: 24, alignment: .leading)
                                .font(.callout)
                        }
                        
                        HStack {
                            Image("calorie")
                                .resizable()
                                .frame(width: 16, height: 16)
                            Text("5g of salt")
                                .frame(width: 260, height: 24, alignment: .leading)
                                .font(.callout)
                        }
                        
                        HStack {
                            Image("calorie")
                                .resizable()
                                .frame(width: 16, height: 16)
                            Text("66g of fat")
                                .frame(width: 260, height: 24, alignment: .leading)
                                .font(.callout)
                        }
                    }
                    
                }
                .padding(.bottom, 20)
            }
            .offset(y: -90)
            
            VStack {
                Text("Maximum nutrient need")
                    .foregroundColor(Color(red: 0.55, green: 0.58, blue: 0.67))
                    .font(.callout)
                    .frame(width: 325, height: 24, alignment: .leading)
                
                LabeledContent {
                    TextField("Name", text: $inputName)
                        .multilineTextAlignment(.trailing)
                } label: {
                    HStack {
                        Text("name")
                        Spacer()
                    }
                    
                }
                //            Picker("Notify Me About", selection: $notifyMeAbout) {
                //                Text("Direct Messages").tag(NotifyMeAboutType.directMessages)
                //                Text("Mentions").tag(NotifyMeAboutType.mentions)
                //                Text("Anything").tag(NotifyMeAboutType.anything)
                //            }
                Form {
                    LabeledContent {
                        TextField("Age", text: $inputAge)
                            .multilineTextAlignment(.trailing)
                    } label: {
                        HStack {
                            Text("age")
                            Spacer()
                        }
                    }
                    LabeledContent {
                        TextField("Height", text: $inputHeight)
                            .multilineTextAlignment(.trailing)
                    } label: {
                        HStack {
                            Text("height")
                            Spacer()
                        }
                    }
                    LabeledContent {
                        TextField("Weight", text: $inputWeight)
                            .multilineTextAlignment(.trailing)
                    } label: {
                        HStack {
                            Text("weight")
                            Spacer()
                        }
                    }
                }
            }
            .offset(y: -90)
            //        Form {
            //            Section(header: Text("Notifications")) {
            //                Picker("Exercise", selection: $notifyMeAbout) {
            //                    Text("Direct Messages").tag(NotifyMeAboutType.directMessages)
            //                }
            //            }
            //        }
        }
    }
}
    
    
    #Preview {
        Profile(inputName: .constant("test"), inputAge: .constant("test"), inputHeight: .constant("test"), inputWeight: .constant("test"), inputType: .constant("test"))
    }
