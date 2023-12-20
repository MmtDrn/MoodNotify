//
//  SplashView.swift
//  MoodNotify
//
//  Created by mehmet duran on 14.12.2023.
//

import SwiftUI

enum SplashNavigate {
    case login
    case sign
}

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
                
                VStack(spacing: 15) {
                    NavigationLink(value: SplashNavigate.login) {
                        Text("Login")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: .widthSize(320), height: .heightSize(45))
                            .padding(.vertical, 5)
                            .background(.colorButtonSecond)
                            .clipShape(.capsule)
                    }
                    
                    NavigationLink(value: SplashNavigate.sign) {
                        Text("Sign In")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.colorButtonSecond)
                            .frame(width: .widthSize(320), height: .heightSize(45))
                            .padding(.vertical, 5)
                            .background(.colorButtonThird.opacity(0.7))
                            .clipShape(.capsule)
                    }
                } //: Links
                .padding(.top)
            } //: VStack
            .navigationDestination(for: SplashNavigate.self) { navigate in
                switch navigate {
                case .login:
                    LoginView()
                        .toolbarRole(.editor)
                case .sign:
                    RegisterView()
                        .toolbarRole(.editor)
                }
            }
        } //: NavigationStack
    }
}

#Preview {
    SplashView()
}
