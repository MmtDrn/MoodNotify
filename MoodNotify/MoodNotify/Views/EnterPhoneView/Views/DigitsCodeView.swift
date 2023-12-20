//
//  DigitsCodeView.swift
//  MoodNotify
//
//  Created by mehmet duran on 29.11.2023.
//

import SwiftUI

struct DigitsCodeView: View {
    // MARK: - Properties
    @State private var remainingSeconds = 120
    @State private var timer: Timer?
    @State private var buttonTitle: String = "Continue"
    
    // MARK: - Body
    var body: some View {
        VStack {
            Text("Enter 4-digits code")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.colorButtonSecond)
                .shadow(color: .white, radius: 5)
                .padding(.top, .heightSize(50))
            
            Text("EnterOTP code we sent to +123213213. This code will expired in \(formatTime(remainingSeconds))".convertAttributed())
                .multilineTextAlignment(.center)
                .foregroundStyle(.colorButtonSecond)
                .padding(.horizontal, .widthSize(50))
            
           CodeInputView()
            
            Button {
                remainingSeconds = 120
            } label: {
                Text(buttonTitle)
            }
            .padding(.top)
            .padding(.horizontal, .widthSize(40))
            .buttonStyle(OnboardingButtonStyle())
            
            Spacer()
        } //: VStack
        .onAppear {
            startTimer()
        }
    }
    
    func startTimer() {
        buttonTitle = "Continue"
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                if remainingSeconds > 0 {
                    remainingSeconds -= 1
                } else {
                    timer.invalidate()
                    buttonTitle = "Send again"
                }
            }
        }

        func formatTime(_ seconds: Int) -> String {
            let minutes = seconds / 60
            let seconds = seconds % 60
            return String(format: "%02d:%02d", minutes, seconds)
        }
}

#Preview {
    DigitsCodeView()
}
