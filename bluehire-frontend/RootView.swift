//
//  ContentView.swift
//  bluehire-frontend
//
//  Created by Tiong Tze Yi on 12/09/2024.
//

import SwiftUI
import KeychainSwift

struct RootView: View {
    let keychain = KeychainSwift()
    
    var body: some View {
        let auth_id = keychain.get("auth_token") ?? ""
        if (auth_id != "") {
            CoreView()
        } else {
            LogInView()
        }
    
    }
}
