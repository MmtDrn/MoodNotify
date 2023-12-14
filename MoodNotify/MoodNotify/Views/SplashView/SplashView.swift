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
    
    @State var navigateCase: SplashNavigate?
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: .heightSize(20)) {
                Text("MoodNotify")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(LinearGradient(colors: [.colorMan.opacity(2), .colorWomen.opacity(2)], startPoint: .leading, endPoint: .trailing))
                
                CircleView()
                
                Text("MoodNotify allows you to instantly share your feelings or what you're up to, stay connected with friends, and explore different moods around you!")
                    .padding(.horizontal)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(LinearGradient(colors: [.colorWomen.opacity(2), .colorMan.opacity(2)], startPoint: .leading, endPoint: .trailing))
                    .padding(.vertical)
                
                VStack(spacing: 15) {
                    Button(action: {
                        isPresented = true
                        navigateCase = .login
                    }, label: {
                        Text("Login")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: .widthSize(320), height: .heightSize(45))
                            .padding(.vertical, 5)
                            .background(.colorButtonSecond)
                            .clipShape(.capsule)
                    })
                    
                    Button(action: {
                        isPresented = true
                        navigateCase = .sign
                    }, label: {
                        Text("Sign In")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.colorButtonSecond)
                            .frame(width: .widthSize(320), height: .heightSize(45))
                            .padding(.vertical, 5)
                            .background(.colorButtonThird.opacity(0.7))
                            .clipShape(.capsule)
                    })
                } //: Buttons
                .padding(.top)
            } //: VStack
            .navigationDestination(isPresented: $isPresented) {
                switch navigateCase {
                case .login:
                    LoginView()
                case .sign:
                    RegisterView()
                case .none:
                    EmptyView()
                }
            }
        } //: NavigationStack
    }
}

#Preview {
    SplashView()
}
