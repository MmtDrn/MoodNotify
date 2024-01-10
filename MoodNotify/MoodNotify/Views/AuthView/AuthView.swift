//
//  AuthView.swift
//  MoodNotify
//
//  Created by mehmet duran on 30.11.2023.
//

import SwiftUI
import _AuthenticationServices_SwiftUI

struct AuthView: View {
    @ObservedObject private var viewModel = AuthViewModel(authManager: FBAuthManager.shared)
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            Text("MoodNotify")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(LinearGradient(colors: [.colorWomen.opacity(2), .colorMan.opacity(2)], startPoint: .leading, endPoint: .trailing))
                .padding(.bottom, 50)
                .shadow(color: .colorWomen, radius: 2)
                .padding(.bottom, .heightSize(50))
            
            AuthMidView()
                .padding(.bottom, .heightSize(50))
            
            Text("Choose Your Signin Method and Be Notified")
                .padding(.horizontal)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundStyle(LinearGradient(colors: [.colorMan.opacity(2), .colorWomen.opacity(2)], startPoint: .leading, endPoint: .trailing))
                .padding(.bottom, .heightSize(50))
            
            AuthButtonsView {
                Task {
                    await viewModel.authWithGoogle()
                }
            } handleAppleRequest: { request in
                viewModel.handleSignInWithAppleRequest(request)
            } handleAppleCompletion: { result in
                viewModel.handleSignInWithAppleCompletion(result)
            }
        } //: VStack
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $viewModel.isPresented) {
            switch viewModel.navigateCase {
            case .withApple:
                UserAppearanceView()
                    .toolbarRole(.editor)
            case .withGoogle:
                UserAppearanceView()
                    .toolbarRole(.editor)
            case .none:
                EmptyView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        AuthView()
    }
}
