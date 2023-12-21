//
//  UserAppearanceViewModel.swift
//  MoodNotify
//
//  Created by mehmet duran on 20.12.2023.
//

import UIKit

class UserAppearanceViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var fullNameShake = false
    @Published var birthdayShake = false
    @Published var genderTypeShake = false
    @Published var interestsShake = false
    @Published var imagesURLShake = false
    
    var name: String = ""
    var date = Date()
    var genderType: Int?
    @Published var interests = [InterestsModel]()
    @Published var images: [UIImage] = []
    
    
    @Published var currentStep: RegisterStep = .nameBirthday
    @Published var stepIndex: Int = 0 {
        didSet {
            guard let newStep = RegisterStep(rawValue: stepIndex) else { return }
            currentStep = newStep
        }
    }
    
    // MARK: - Logics
}
