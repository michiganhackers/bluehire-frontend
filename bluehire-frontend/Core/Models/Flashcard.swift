//
//  CompanyTracker.swift
//  bluehire-frontend
//
//  Created by Tiong Tze Yi on 28/09/2024.
//

import Foundation

struct Flashcard_Info: Codable {
    var streak: Int
    var flashcards: [Flashcard]
}

struct Flashcard: Identifiable, Codable {
    var id: Int
    var title: String
    var description: String
    var solution: String
}


