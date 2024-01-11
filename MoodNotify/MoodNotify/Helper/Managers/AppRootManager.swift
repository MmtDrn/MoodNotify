//
//  AppRootManager.swift
//  MoodNotify
//
//  Created by mehmet duran on 11.01.2024.
//

import Foundation

protocol RootManagerProtocol {
    var currentRoot: eAppRoots { get set }
}

final class AppRootManager: RootManagerProtocol, ObservableObject {
    @Published var currentRoot: eAppRoots = .splash
}
