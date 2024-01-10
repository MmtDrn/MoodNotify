//
//  TabbarModel.swift
//  MoodNotify
//
//  Created by mehmet duran on 10.01.2024.
//

import Foundation

enum TabModel: String, CaseIterable {
    case home = "Home"
    case messages = "Messages"
    case profile = "Profile"
    
    var systemImage: String {
        switch self {
        case .home:
            return "house"
        case .messages:
            return "message"
        case .profile:
            return "person"
        }
    }
    
    var index: Int {
        return TabModel.allCases.firstIndex(of: self) ?? 0
    }
}
