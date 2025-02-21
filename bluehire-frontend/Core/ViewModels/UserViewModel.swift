//
//  UserViewModel.swift
//  bluehire-frontend
//
//  Created by Danish Imran on 2/5/25.
//

// initially made to test login function

import SwiftUI

class UserViewModel: ObservableObject {
    @Published var user: User?

    init(user: User? = nil) {
        self.user = user
    }
    
    func login(username: String) {
        self.user = User(name: username)
    }
    
    func updateUserName(newName: String) {
        if user != nil {
            self.user = User(name: newName)
        }
    }
}

struct User {
    var name: String
}
