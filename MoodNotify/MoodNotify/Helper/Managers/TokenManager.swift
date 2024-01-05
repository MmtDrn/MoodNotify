//
//  TokenManager.swift
//  MoodNotify
//
//  Created by mehmet duran on 5.01.2024.
//

import Foundation
import KeychainAccess

class TokenManager {
    static let shared = TokenManager()
    private init() { }
    
    private var keychain = Keychain()
    
    var token: String? {
        get {
            return keychain["token"]
        }
        set(newToken) {
            keychain["token"] = newToken
        }
    }
    
    var hasToken: Bool {
        return self.token != nil
    }
}
