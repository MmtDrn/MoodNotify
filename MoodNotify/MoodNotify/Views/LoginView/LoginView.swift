//
//  LoginView.swift
//  MoodNotify
//
//  Created by mehmet duran on 27.11.2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack(spacing: .heightSize(20)) {
            Text("MoodNotify")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(LinearGradient(colors: [.colorMan.opacity(2), .colorWomen.opacity(2)], startPoint: .leading, endPoint: .trailing))
                .padding(.bottom, 50)
            
            LoginOnboardingView()
                .padding(.bottom, 100)
            
            Text("Choose Your Login Method and Be Notified")
                .padding(.horizontal)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundStyle(LinearGradient(colors: [.colorWomen.opacity(2), .colorMan.opacity(2)], startPoint: .leading, endPoint: .trailing))
            
            LoginButtonsView()
        }
    }
}

#Preview {
    LoginView()
}
