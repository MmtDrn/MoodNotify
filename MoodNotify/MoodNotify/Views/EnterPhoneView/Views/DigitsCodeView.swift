//
//  DigitsCodeView.swift
//  MoodNotify
//
//  Created by mehmet duran on 29.11.2023.
//

import SwiftUI

struct DigitsCodeView: View {
    // MARK: - Properties
    
    
    // MARK: - Body
    var body: some View {
        VStack {
            Text("Enter 4-digits code")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.colorButton)
                .shadow(color: .white, radius: 5)
                .padding(.top, .heightSize(50))
            
            Text("EnterOTP code we sent to +123213xxx. This code will expired in 01:50")
                .font(.subheadline)
                .fontWeight(.thin)
                .multilineTextAlignment(.center)
                .foregroundStyle(.colorButton)
                .padding(.horizontal, .widthSize(50))
            
           CodeInputView()
            
            Button {
                // Move to the next step
            } label: {
                Text("Continue")
            }
            .padding(.top)
            .padding(.horizontal, .widthSize(40))
            .buttonStyle(OnboardingButtonStyle())
            
            Spacer()
        } //: VStack
        .background(
            LinearGradient(colors: [.colorWomen.opacity(0.8), .colorMan.opacity(0.8)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    DigitsCodeView()
}
