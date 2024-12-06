//
//  FlashcardViewModel.swift
//  bluehire-frontend
//
//  Created by Tze Yi Tiong on 11/14/24.
//

import Foundation

class FlashcardViewModel: ObservableObject {
    @Published var flashcard_info: Flashcard_Info
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        // Example initialization
        self.flashcard_info = Flashcard_Info(
            streak: 0,
            flashcards: [
                Flashcard(id: 1, title: "Sample Title", description: "Sample Description", solution: "Sample Solution")
            ]
        )
        Task {
            await fetchFlashcards()
            //await fetchDummyData()
        }
    }
    func fetchFlashcards() async {
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: "http://127.0.0.1:5000/flashcard/") else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                errorMessage = "Server error, please try again later."
                isLoading = false
                return
            }

            
            // MARK: - Retrieve and process api data
            self.flashcard_info = try JSONDecoder().decode(Flashcard_Info.self, from: data)
            //self.companies = try JSONDecoder().decode([Company].self, from: data)
            
        } catch {
            errorMessage = "Failed to fetch data: \(error.localizedDescription)"
            print("Error while fetching data", error)
        }
        
        isLoading = false
    }
    
    
    // TODO: - Only use this func before api endpoints are setup
    func fetchDummyData() async {
        isLoading = true
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            //self.companies = Company.dummyData
            self.isLoading = false
        }
    }
    
}
