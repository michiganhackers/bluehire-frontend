//
//  bluehire_frontendApp.swift
//  bluehire-frontend
//
//  Created by Tiong Tze Yi on 12/09/2024.
//

import GoogleSignIn
import SwiftUI

@main
struct bluehire_frontendApp: App {
    @StateObject private var userViewModel = UserViewModel(user: User(name: "John Doe"))
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RootView()
                    .environmentObject(userViewModel)
                    .onOpenURL(perform: { url in
                        GIDSignIn.sharedInstance.handle(url)
                    })
            }
        }
    }
}
