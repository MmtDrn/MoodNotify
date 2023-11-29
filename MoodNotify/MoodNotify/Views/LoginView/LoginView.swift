//
//  LoginView.swift
//  MoodNotify
//
//  Created by mehmet duran on 27.11.2023.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: .heightSize(20)) {
                Text("MoodNotify")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.colorButton)
                
                CircleView()
                
                Text("MoodNotify allows you to instantly share your feelings or what you're up to, stay connected with friends, and explore different moods around you!")
                    .padding(.horizontal)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(LinearGradient(colors: [.colorWomen.opacity(2), .colorMan.opacity(2)], startPoint: .leading, endPoint: .trailing))
                
                LoginButtonsView()
            }
        }
    }
}

#Preview {
    LoginView()
}
