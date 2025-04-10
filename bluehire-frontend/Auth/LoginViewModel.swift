//
//  LoginViewModel.swift
//  bluehire-frontend
//
//  Created by Tze Yi Tiong on 4/6/25.
//


import SwiftUI
import KeychainSwift

class LoginViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    private let keychain = KeychainSwift()
    
    init() {
        if let token = keychain.get("auth_token"), !token.isEmpty {
            isLoggedIn = true
        }
    }

    func login(with token: String) {
        if keychain.set(token, forKey: "auth_token") {
            isLoggedIn = true
        }
    }

    func logout() {
        keychain.delete("auth_token")
        isLoggedIn = false
    }
}

