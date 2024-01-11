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
    @StateObject private var appRootManager = AppRootManager()
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appRootManager.currentRoot {
                case .splash:
                    SplashView()
                case .tabbar:
                    TabbarView()
                }
            }
            .environmentObject(appRootManager)
        }
    }
}
