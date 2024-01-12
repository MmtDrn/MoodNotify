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
    @EnvironmentObject private var appRootManager: AppRootManager
    
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
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("oops!"),
                  message: Text("Something went wrong. Please try again."),
                  dismissButton: .default(Text("OK")))
        }
        .onReceive(viewModel.$succesLogin, perform: { value in
            switch value {
            case true:
                withAnimation(.easeIn) {
                    self.appRootManager.currentRoot = .tabbar
                }
            case false:
                self.viewModel.showAlert.toggle()
            default: break
            }
        })
    }
}

#Preview {
    NavigationStack {
        AuthView()
    }
}
