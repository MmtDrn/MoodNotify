//
//  AuthViewModel.swift
//  MoodNotify
//
//  Created by mehmet duran on 5.12.2023.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    // MARK: - Properties
    @Published var isPresented: Bool = false
    var navigateCase: RegisterNavigate?
    
    // MARK: - Logics
    private func authWithApple() {
        print("loginWithApple")
    }
    
    private func authWithGoogle() {
        print("loginWithGoogle")
    }
    
    func navigateLogic(_ navigateCase: RegisterNavigate) {
        self.isPresented = true
        self.navigateCase = navigateCase
        
        switch navigateCase {
        case .withApple:
            authWithApple()
        case .withGoogle:
            authWithGoogle()
        }
        
    }
}
