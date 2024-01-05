//
//  FBAuthManager.swift
//  MoodNotify
//
//  Created by mehmet duran on 4.01.2024.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices
import CryptoKit

class FBAuthManager: FBAuthManagerProtocol {
    
    static var shared = FBAuthManager()
    private init() { }
    
    private var currentNonce: String?
    
    func authWithGoogle() async -> (Result<Bool,AuthError>) {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            return .failure(.notClientID)
        }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let windowScene = await UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = await windowScene.windows.first,
              let rootViewController = await window.rootViewController else { return .failure(.notWindowScene) }
        
        do {
            let userAuth = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            let user = userAuth.user
            
            let accessToken = user.accessToken
            guard let idToken = user.idToken else { return .failure(.notIDToken) }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString,
                                                           accessToken: accessToken.tokenString)
            
           
            
            do {
                let result = try await Auth.auth().signIn(with: credential)
                TokenManager.shared.token = result.user.uid
                return .success(true)
            } catch {
                return .failure(.notAuth)
            }
        } catch {
            print(error.localizedDescription)
            return .failure(.notAuth)
        }
    }
    
    func handleSignInWithAppleRequest(_ request: ASAuthorizationOpenIDRequest) {
        let nonce = randomNonceString()
        currentNonce = nonce
        request.nonce = sha256(nonce)
    }
    
    func handleSignInWithAppleCompletion(_ result: Result<ASAuthorization, Error>) async -> (Result<Bool,AuthError>) {
        
        switch result {
        case .success(let success):
            if let appleIDCredential = success.credential as? ASAuthorizationAppleIDCredential {
              guard let nonce = currentNonce else {
                  return .failure(.notNonce)
              }
              guard let appleIDToken = appleIDCredential.identityToken else {
                  return .failure(.notAppleIDToken)
              }
              guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                  return .failure(.notIDToken)
              }

              let credential = OAuthProvider.appleCredential(withIDToken: idTokenString,
                                                             rawNonce: nonce,
                                                             fullName: appleIDCredential.fullName)
                
             do {
                 let result = try await Auth.auth().signIn(with: credential)
                 TokenManager.shared.token = result.user.uid
                 return .success(true)
             }
             catch {
                 print("Error authenticating: \(error.localizedDescription)")
                 return .failure(.notAuth)
             }
            } else { return .failure(.appleIDCredential) }
        case .failure(let failure):
            print(failure.localizedDescription)
            return .failure(.notAuth)
        }
    }
    
    func signout() -> Bool {
        do {
            try Auth.auth().signOut()
        } catch {
            return false
        }
        return true
    }
}

// MARK: - Helper methods
extension FBAuthManager {
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: [Character] =
      Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length

      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError(
              "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
          }
          return random
        }

        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }

      return result
    }
    
    private func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        String(format: "%02x", $0)
      }.joined()

      return hashString
    }
}
