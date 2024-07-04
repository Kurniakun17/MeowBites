import SwiftUI


struct Profile: View {
    @Binding var inputName: String
    @Binding var inputAge: String
    @Binding var inputHeight: String
    @Binding var inputWeight: String
    @Binding var inputType: String
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image("grass")
                        .resizable()
                        .scaledToFill()
                        .padding(.top, 70)
                    
                    HStack {
                        Image("back")
                            .frame(width: 100)
                        Spacer()
                    }
                }
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: .infinity)
                        .background(Color.white)
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
                    Form {
                        Text("User Information")
                            .foregroundColor(Color(red: 0.55, green: 0.58, blue: 0.67))
                            .font(.callout)
                            .frame(width: 325, height: 24, alignment: .leading)
                        
                        VStack {
                            Section {
                                TextField("Name", text: $inputName)
                                    .multilineTextAlignment(.trailing)
                            } header: {
                                Text("Name")
                            }
                            
                            Section {
                                TextField("Age", text: $inputAge)
                                    .multilineTextAlignment(.trailing)
                            } header: {
                                Text("Age")
                            }
                            
                            Section {
                                TextField("Height", text: $inputHeight)
                                    .multilineTextAlignment(.trailing)
                            } header: {
                                Text("Height")
                            }
                            
                            Section {
                                TextField("Weight", text: $inputWeight)
                                    .multilineTextAlignment(.trailing)
                            } header: {
                                Text("Weight")
                            }
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal)
                }
                .offset(y: -290)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    Profile(inputName: .constant("test"), inputAge: .constant("test"), inputHeight: .constant("test"), inputWeight: .constant("test"), inputType: .constant("test"))
}
