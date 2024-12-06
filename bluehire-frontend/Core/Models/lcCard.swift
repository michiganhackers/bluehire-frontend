//
//  Card.swift
//  bluehire-frontend
//
//  Created by Danish Imran on 10/26/24.
//

import Foundation

struct lcCard {
    var text: String
    var difficulty: String
    
    static let dummyData : [lcCard] = [
        lcCard(text: "Two Sum", difficulty: "easy"),
        lcCard(text: "Three Sum", difficulty: "medium"),
        lcCard(text: "Four Sum", difficulty: "hard"),
        lcCard(text: "Five Sum", difficulty: "hard"),
        lcCard(text: "Six Sum", difficulty: "hard")
    ]
}
