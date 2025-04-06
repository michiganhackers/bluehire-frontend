//
//  ContentView.swift
//  bluehire-frontend
//
//  Created by Tiong Tze Yi on 12/09/2024.
//

import SwiftUI

struct RootView: View {
    // Environment Object is used to allow child to access defined ViewModels.
    // This means that CoreView and LoginView don't need to create a new instance
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        if (loginViewModel.isLoggedIn) {
            CoreView()
                .environmentObject(loginViewModel)
            Button("Logout") {
                loginViewModel.logout()
            }
        } else {
            LogInView()
                .environmentObject(loginViewModel)
        }
    }
}
