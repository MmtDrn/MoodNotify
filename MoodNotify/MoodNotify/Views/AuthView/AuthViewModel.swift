//
//  AuthViewModel.swift
//  MoodNotify
//
//  Created by mehmet duran on 5.12.2023.
//

import SwiftUI
import AuthenticationServices
import Combine

class AuthViewModel: ObservableObject {
    // MARK: - Properties
    @Published var succesLogin: Bool?
    @Published var showAlert: Bool = false
    
    private var appRootManager: AppRootManager?
    private var authManager: FBAuthManagerProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(authManager: FBAuthManagerProtocol) {
        self.authManager = authManager
        addLoginResultSubscriber()
    }
    
    func setupAppRouter(router: AppRootManager) {
        self.appRootManager = router
    }
    
    private func addLoginResultSubscriber() {
        $succesLogin
            .sink { [weak self] value in
                guard let self else { return }
                switch value {
                case true:
                    withAnimation(.easeIn) {
                        guard let appRootManager = self.appRootManager else { return }
                        appRootManager.currentRoot = .tabbar
                    }
                case false:
                    self.showAlert.toggle()
                default: break
                }
            }
            .store(in: &cancellables)
    }
    
    func authWithGoogle() async {
        Task {
            let result = await authManager.authWithGoogle()
            
            DispatchQueue.main.async {
                switch result {
                case .success:
                    self.succesLogin = true
                case .failure(let failure):
                    self.succesLogin = false
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
                case .success:
                    self.succesLogin = true
                case .failure(let failure):
                    self.succesLogin = false
                }
            }
        }
    }
}
