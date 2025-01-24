//
//  WebService.swift
//  bluehire-frontend
//
//  Created by Tze Yi Tiong on 1/23/25.
//

import Foundation

class WebService {
    private let hostname = "http://127.0.0.1:5000"
    
    // Bookmark ViewModel
    func fetchBookmarkedCompanies() async throws -> [Company]? {
        guard let url = URL(string:
            "\(hostname)/bookmark/") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json",
            forHTTPHeaderField: "Content-Type")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("[fetchBookMmarkedCompanies] error while fetching data")
                throw URLError(.badServerResponse)
            }
            let dateFormatter: DateFormatter = {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                formatter.timeZone = TimeZone(abbreviation: "UTC")
                return formatter
            }()

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            // MARK: - Retrieve and process api data
            return try decoder.decode([Company].self, from: data)
        }
    }
    
    // Flashcard ViewModel
    func fetchFlashcards() async throws -> Flashcard_Info {
        guard let url = URL(string:
            "\(hostname)/flashcard/") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json",
            forHTTPHeaderField: "Content-Type")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("[fetchFlashcards] error while fetching data")
                throw URLError(.badServerResponse)
            }

            // MARK: - Retrieve and process api data
            return try JSONDecoder().decode(Flashcard_Info.self, from: data)
        }
    }
        
    
    
    
}
