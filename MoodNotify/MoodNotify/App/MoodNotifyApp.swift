//
//  MoodNotifyApp.swift
//  MoodNotify
//
//  Created by mehmet duran on 27.11.2023.
//

import SwiftUI

@main
struct MoodNotifyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
