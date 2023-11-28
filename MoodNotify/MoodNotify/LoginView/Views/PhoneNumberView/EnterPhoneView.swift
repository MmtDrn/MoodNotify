//
//  EnterPhoneView.swift
//  MoodNotify
//
//  Created by mehmet duran on 28.11.2023.
//

import SwiftUI
import Combine

struct PhoneNumberView: View {
    @State var presentSheet = false
    @State var countryModel: CPDataModel = CPDataModel.example
    @State var mobPhoneNumber = ""
    @Environment(\.colorScheme) var colorScheme
    @FocusState private var keyIsFocused: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Enter your phone")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.colorButton)
                        .shadow(color: .white, radius: 5)
                        .padding(.top, .heightSize(50))
                    
                    HStack {
                        Button {
                            presentSheet = true
                            keyIsFocused = false
                        } label: {
                            Text("\(countryModel.flag) \(countryModel.dial_code)")
                                .fontWeight(.semibold)
                                .padding(10)
                                .frame(minWidth: 80, minHeight: 47)
                                .foregroundStyle(.colorButton)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.colorButton, lineWidth: 2)
                                )
                                .background(.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                                
                        }
                        
                        TextField("", text: $mobPhoneNumber)
                            .placeholder(when: mobPhoneNumber.isEmpty) {
                                Text("Phone number")
                                    .foregroundColor(.colorButton.opacity(0.6))
                            }
                            .focused($keyIsFocused)
                            .keyboardType(.numberPad)
                            .onReceive(Just(mobPhoneNumber)) { _ in
                                applyPatternOnNumbers(&mobPhoneNumber, pattern: countryModel.pattern, replacementCharacter: "#")
                            }
                            .padding(10)
                            .frame(minWidth: 80, minHeight: 47)
                            .foregroundStyle(.colorButton)
                            .fontWeight(.semibold)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.colorButton, lineWidth: 2)
                            )
                            .background(.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                        
                    }
                    .padding(.bottom, .heightSize(30))
                    
                    Button {
                        // Move to the next step
                    } label: {
                        Text("Continue")
                    }
                    .disableWithOpacity(mobPhoneNumber.count < 1)
                    .buttonStyle(OnboardingButtonStyle())
                    
                    Spacer()
                }
                .animation(.easeInOut(duration: 0.6), value: keyIsFocused)
                .padding(.horizontal)
            } //: ZStack
            .background(LinearGradient(colors: [.colorWomen.opacity(0.8), .colorMan.opacity(0.8)], startPoint: .top, endPoint: .bottom))
        } //: NavigationStack
        .onTapGesture {
            hideKeyboard()
        }
        .sheet(isPresented: $presentSheet) {
            PickCPCodeView(presentSheet: $presentSheet, countryModel: $countryModel)
        }
        .ignoresSafeArea(.keyboard)
    }
    
    func applyPatternOnNumbers(_ stringvar: inout String, pattern: String, replacementCharacter: Character) {
        var pureNumber = stringvar.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else {
                stringvar = pureNumber
                return
            }
            let stringIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        stringvar = pureNumber
    }
}

#Preview {
    PhoneNumberView()
}
