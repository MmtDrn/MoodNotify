//
//  RegisterViewModel.swift
//  MoodNotify
//
//  Created by mehmet duran on 5.12.2023.
//

import SwiftUI

class RegisterViewModel: ObservableObject {
    // MARK: - Properties
    @Published var isPresented: Bool = false
    var navigateCase: RegisterNavigate?
    
    // MARK: - Logics
    private func registerWithPhone() {
        print("loginWithPhone")
    }
    
    private func registerWithApple() {
        print("loginWithApple")
    }
    
    private func registerWithGoogle() {
        print("loginWithGoogle")
    }
    
    func navigateLogic(_ navigateCase: RegisterNavigate) {
        self.isPresented = true
        self.navigateCase = navigateCase
        
        switch navigateCase {
        case .phoneNumber:
            registerWithPhone()
        case .withApple:
            registerWithApple()
        case .withGoogle:
            registerWithGoogle()
        }
        
    }
}
