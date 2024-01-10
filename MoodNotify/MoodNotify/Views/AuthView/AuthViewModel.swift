//
//  AuthViewModel.swift
//  MoodNotify
//
//  Created by mehmet duran on 5.12.2023.
//

import SwiftUI
import AuthenticationServices

class AuthViewModel: ObservableObject {
    // MARK: - Properties
    @Published var isPresented: Bool = false
    var navigateCase: AuthNavigate?
    
    var authManager: FBAuthManagerProtocol
    
    init(authManager: FBAuthManagerProtocol) {
        self.authManager = authManager
    }
    
    func authWithGoogle() async {
        Task {
            let result = await authManager.authWithGoogle()
            
            DispatchQueue.main.async {
                switch result {
                case .success(let success):
                    print(success)
                case .failure(let failure):
                    print(failure)
                }
            }
        }
    }
    
    func handleSignInWithAppleRequest(_ request: ASAuthorizationOpenIDRequest) {
        authManager.handleSignInWithAppleRequest(request)
    }
    
    func handleSignInWithAppleCompletion(_ result: Result<ASAuthorization, Error>) {
        Task {
           let authResult = await authManager.handleSignInWithAppleCompletion(result)
            
            DispatchQueue.main.async {
                switch authResult {
                case .success(let success):
                    self.navigateLogic(.withApple)
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
    
    func navigateLogic(_ navigateCase: AuthNavigate) {
        self.isPresented = true
        self.navigateCase = navigateCase
        
        switch navigateCase {
        case .withApple:
            break
        case .withGoogle:
           break
        }
        
    }
}
