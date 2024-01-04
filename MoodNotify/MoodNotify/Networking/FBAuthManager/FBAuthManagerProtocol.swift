//
//  FBAuthManagerProtocol.swift
//  MoodNotify
//
//  Created by mehmet duran on 4.01.2024.
//

import Foundation
import AuthenticationServices

protocol FBAuthManagerProtocol {
    func authWithGoogle() async -> Bool
    func signout() -> Bool
    func handleSignInWithAppleRequest(_ request: ASAuthorizationOpenIDRequest)
    func handleSignInWithAppleCompletion(_ result: Result<ASAuthorization, Error>) async -> Bool
}
