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
        GeometryReader { geo in
            ZStack {
                VStack {
                    Image("grass")
                        .resizable()
                        .scaledToFit()
                        .padding(0)
                    VStack {
                        
                        ScrollView {
                            VStack {
                                List {
                                    Section(header: Text("Calorie Need")) {
                                        HStack {
                                            Image("calorie")
                                                .resizable()
                                                .frame(width: 24, height: 24)
                                            Spacer().frame(width: 6)
                                            Text("1,978 calories")
                                        }
                                    }
                                }
                            }
                            .frame(minHeight: 100)
                            .scrollContentBackground(.hidden)
                            
                            
                            VStack(alignment: .leading, spacing: 0) {
                                
                                List {
                                    Section(header: Text("Maximum nutrient need")) {
                                        HStack {
                                            Image("sugarlogo")
                                                .frame(width: 16, height: 16)
                                            Spacer().frame(width: 14)
                                            Text("148 of sugar")
                                        }
                                        HStack {
                                            Image("saltlogo")
                                                .frame(width: 16, height: 16)
                                            Spacer().frame(width: 14)
                                            Text("5g of salt")
                                        }
                                        HStack {
                                            Image("fatlogo")
                                                .frame(width: 16, height: 16)
                                            Spacer().frame(width: 14)
                                            Text("66g of fat")
                                        }
                                    }
                                }
                                .frame(height: 200)
                                .scrollContentBackground(.hidden)
                            }
                            
                            
                            
                            VStack(spacing: 20) {
                                List {
                                    Section(header: Text("Personal Information")) {
                                        HStack {
                                            Text("Name")
                                            Spacer()
                                            TextField("Name", text: $inputName)
                                                .multilineTextAlignment(.trailing)
                                                .textFieldStyle(PlainTextFieldStyle())
                                        }
                                        HStack {
                                            Text("Gender")
                                            Spacer()
                                            Picker("", selection: $selectedGender) {
                                                ForEach(genders, id: \.self) {
                                                    Text($0)
                                                }
                                            }
                                            .pickerStyle(MenuPickerStyle())
                                        }
                                        HStack {
                                            Text("Age")
                                            Spacer()
                                            TextField("Age", text: $inputAge)
                                                .multilineTextAlignment(.trailing)
                                                .textFieldStyle(PlainTextFieldStyle())
                                        }
                                        HStack {
                                            Text("Height")
                                            Spacer()
                                            TextField("Height", text: $inputHeight)
                                                .multilineTextAlignment(.trailing)
                                                .textFieldStyle(PlainTextFieldStyle())
                                        }
                                        HStack {
                                            Text("Weight")
                                            Spacer()
                                            TextField("Weight", text: $inputWeight)
                                                .multilineTextAlignment(.trailing)
                                                .textFieldStyle(PlainTextFieldStyle())
                                        }
                                    }
                                }
                                .frame(height: 280)
                                .scrollContentBackground(.hidden)
                                
                                List {
                                    Section(header: Text("Exercise")) {
                                        HStack {
                                            Text("Type")
                                            Spacer()
                                            Picker("", selection: $selectedExercise) {
                                                ForEach(exercises, id: \.self) {
                                                    Text($0)
                                                }
                                            }
                                            .pickerStyle(MenuPickerStyle())
                                        }
                                    }
                                }
                                .frame(height: 90)
                                .scrollContentBackground(.hidden)
                            }
                        }
                        .background(Color(red: 0.95, green: 0.95, blue: 0.96))
                        
                    }
                    .padding(0)
                    .background(Color(red: 0.95, green: 0.95, blue: 0.96))
                }
                
                VStack {
                    Image("back")
                        .frame(width: 400, height: 100, alignment: .leading)
                    Image("frame1")
                    Spacer()
                }
            }
            .ignoresSafeArea()
            .frame(maxHeight: .infinity)
            .background(Color(red: 0.95, green: 0.95, blue: 0.96))
        }
    }
}


#Preview {
    cobaProfile(inputName: .constant("Meow"), inputAge: .constant("27"), inputHeight: .constant("172"), inputWeight: .constant("59"), inputType: .constant("test"))
}

