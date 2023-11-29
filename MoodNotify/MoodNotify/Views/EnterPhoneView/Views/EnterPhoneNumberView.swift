//
//  EnterPhoneNumberView.swift
//  MoodNotify
//
//  Created by mehmet duran on 29.11.2023.
//

import SwiftUI
import Combine

struct EnterPhoneNumberView: View {
    @Binding var step: VerifyPhoneStep
    @FocusState private var keyIsFocused: Bool
    @State var presentSheet = false
    @State var countryModel: CPDataModel = CPDataModel.example
    @State var mobPhoneNumber = ""
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
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
                withAnimation(.bouncy) {
                    step = .code
                }
            } label: {
                Text("Continue")
            }
            .disableWithOpacity(mobPhoneNumber.count < 1)
            .buttonStyle(OnboardingButtonStyle())
            
            Spacer()
        } //: VStack
        .animation(.easeInOut(duration: 0.6), value: keyIsFocused)
        .padding(.horizontal)
        .background(LinearGradient(colors: [.colorWomen.opacity(0.8), .colorMan.opacity(0.8)], startPoint: .top, endPoint: .bottom))
        .sheet(isPresented: $presentSheet) {
            PickCPCodeView(presentSheet: $presentSheet, countryModel: $countryModel)
        }
        .onAppear {
            keyIsFocused = true
        }
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
    EnterPhoneNumberView(step: .constant(.phoneNumber))
}
