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
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                RootView()
                    .onOpenURL(perform: { url in
                        GIDSignIn.sharedInstance.handle(url)
                    })
            }
        }
    }
}
