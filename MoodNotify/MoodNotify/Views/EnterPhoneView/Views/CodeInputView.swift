//
//  CodeInputView.swift
//  MoodNotify
//
//  Created by mehmet duran on 29.11.2023.
//

import SwiftUI

struct CodeInputView: View {
    @State var code1: String = ""
    @State var code2: String = ""
    @State var code3: String = ""
    @State var code4: String = ""
    
    @FocusState var focused1: Bool
    @FocusState var focused2: Bool
    @FocusState var focused3: Bool
    @FocusState var focused4: Bool
    
    var body: some View {
        HStack(spacing: .widthSize(20)) {
            
            TextField("", text: $code1)
                .frame(width: .widthSize(60), height: .heightSize(60))
                .multilineTextAlignment(.center)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.colorButton)
                .keyboardType(.numberPad)
                .focused($focused1)
                .background(.white)
                .clipShape(.rect(cornerRadius: .widthSize(10)))
                .onChange(of: code1) { newValue in
                    if newValue.count >= 1 {
                        code1 = String(newValue.suffix(1))
                        focused2 = true
                    }
                }
            
            TextField("", text: $code2)
                .frame(width: .widthSize(60), height: .heightSize(60))
                .multilineTextAlignment(.center)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.colorButton)
                .keyboardType(.numberPad)
                .focused($focused2)
                .background(.white)
                .clipShape(.rect(cornerRadius: .widthSize(10)))
                .onChange(of: code2) { newValue in
                    if newValue.count >= 1 {
                        code2 = String(newValue.suffix(1))
                        focused3 = true
                    }
                }
            
            TextField("", text: $code3)
                .frame(width: .widthSize(60), height: .heightSize(60))
                .multilineTextAlignment(.center)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.colorButton)
                .keyboardType(.numberPad)
                .focused($focused3)
                .background(.white)
                .clipShape(.rect(cornerRadius: .widthSize(10)))
                .onChange(of: code3) { newValue in
                    if newValue.count >= 1 {
                        code3 = String(newValue.suffix(1))
                        focused4 = true
                    }
                }
            
            TextField("", text: $code4)
                .frame(width: .widthSize(60), height: .heightSize(60))
                .multilineTextAlignment(.center)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.colorButton)
                .keyboardType(.numberPad)
                .focused($focused4)
                .background(.white)
                .clipShape(.rect(cornerRadius: .widthSize(10)))
                .onChange(of: code4) { newValue in
                    if newValue.count >= 1 {
                        code4 = String(newValue.suffix(1))
                        hideKeyboard()
                    }
                }
        }
        .padding()
        .onAppear {
            focused1 = true
        }
    }
}

#Preview {
    ZStack {
        LinearGradient(colors: [.colorWomen.opacity(0.8), .colorMan.opacity(0.8)], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
        CodeInputView()
    }
}
