//
//  AuthError.swift
//  MoodNotify
//
//  Created by mehmet duran on 5.01.2024.
//

import Foundation

enum AuthError: Error {
    case notClientID
    case notWindowScene
    case notIDToken
    case notAuth
    case notNonce
    case notAppleIDToken
    case appleIDCredential
}
