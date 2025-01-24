//
//  FlashcardViewModel.swift
//  bluehire-frontend
//
//  Created by Tze Yi Tiong on 11/14/24.
//

import Foundation

class FlashcardViewModel: ObservableObject {
    @Published var flashcard_info: Flashcard_Info = Flashcard_Info(streak: 0, flashcards: [])
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        loadFlashcards()
    }
    
    func loadFlashcards() {
        isLoading = true
        errorMessage = nil
        
        Task { @MainActor in
            do {
                let flashcard_info = try await WebService().fetchFlashcards()
                self.flashcard_info = flashcard_info
            } catch {
                errorMessage = "Failed to load flashcards: \(error.localizedDescription)"
            }
            isLoading = false
        }
    }
    
}
