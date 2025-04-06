//
//  ContentView.swift
//  bluehire-frontend
//
//  Created by Tiong Tze Yi on 12/09/2024.
//

import SwiftUI

struct RootView: View {
    @StateObject private var userViewModel = UserViewModel(user: nil)
    
    var body: some View {
        if userViewModel.user != nil {
            CoreView()
                .environmentObject(userViewModel)
        } else {
            LogInView()
                .environmentObject(userViewModel)
        }
    
    }
}
