//
//  RegisterViewModel.swift
//  MoodNotify
//
//  Created by mehmet duran on 5.12.2023.
//

import SwiftUI

class RegisterViewModel: ObservableObject {
    // MARK: - Properties
    @Published var currentStep: RegisterStep = .nameBirthday
    @Published var stepIndex: Int = 0 {
        didSet {
            guard let newStep = RegisterStep(rawValue: stepIndex) else { return }
            currentStep = newStep
        }
    }
    
    // MARK: - Logics
}
