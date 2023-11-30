//
//  RegisterStep.swift
//  MoodNotify
//
//  Created by mehmet duran on 30.11.2023.
//

import Foundation

enum RegisterStep: Int, CaseIterable {
    case nameBirthday
    case gender
    case interest
    case photos
    
    var title: String {
        switch self {
        case .nameBirthday:
            return "What is your name and birthday?"
        case .gender:
            return "What is your gender?"
        case .interest:
            return "Select up to 5 interest"
        case .photos:
            return "Upload your photos"
        }
    }
}
