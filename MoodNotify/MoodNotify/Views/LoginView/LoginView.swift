//
//  LoginView.swift
//  MoodNotify
//
//  Created by mehmet duran on 27.11.2023.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            Text("MoodNotify")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(LinearGradient(colors: [.colorMan.opacity(2), .colorWomen.opacity(2)], startPoint: .leading, endPoint: .trailing))
                .padding(.bottom, 50)
                .shadow(color: .colorWomen, radius: 2)
                .padding(.bottom, .heightSize(50))
            
            LoginOnboardingView()
                .padding(.bottom, .heightSize(50))
            
            Text("Choose Your Login Method and Be Notified")
                .padding(.horizontal)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundStyle(LinearGradient(colors: [.colorWomen.opacity(2), .colorMan.opacity(2)], startPoint: .leading, endPoint: .trailing))
                .padding(.bottom, .heightSize(50))
            
            AuthButtonsView {
                viewModel.loginWithPhone()
            } loginWithAppleAction: {
                viewModel.loginWithApple()
            } loginWithGooleAction: {
                viewModel.loginWithGoogle()
            }

        } //: VStack
        .navigationTitle(Text("Login"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LoginView()
}
