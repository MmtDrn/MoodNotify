//
//  SplashView.swift
//  MoodNotify
//
//  Created by mehmet duran on 14.12.2023.
//

import SwiftUI

struct SplashView: View {
    
    var body: some View {
        NavigationStack {
            VStack(spacing: .heightSize(20)) {
                Text("MoodNotify")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(LinearGradient(colors: [.colorMan.opacity(2), .colorWomen.opacity(2)], startPoint: .leading, endPoint: .trailing))
                    .shadow(color: .colorWomen, radius: 2)
                
                CircleView()
                
                Text("MoodNotify allows you to instantly share your feelings or what you're up to, stay connected with friends, and explore different moods around you!")
                    .padding(.horizontal)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(LinearGradient(colors: [.colorWomen.opacity(2), .colorMan.opacity(2)], startPoint: .leading, endPoint: .trailing))
                    .padding(.vertical)
                
                NavigationLink(value: SplashNavigate.sign) {
                    Text("Continue")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: .widthSize(320), height: .heightSize(45))
                        .padding(.vertical, 5)
                        .background(.colorButtonSecond)
                        .clipShape(.capsule)
                }
                .padding(.top)
            } //: VStack
            .navigationDestination(for: SplashNavigate.self) { navigate in
                switch navigate {
                case .login:
                    LoginView()
                case .sign:
                    AuthView()
                }
            }
        } //: NavigationStack
    }
}

#Preview {
    SplashView()
}
