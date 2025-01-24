//
//  CompanyTrackerViewModel.swift
//  bluehire-frontend
//
//  Created by Tiong Tze Yi on 28/09/2024.
//
//  DOCUMENTATION: https://dev.to/robycigar/how-to-fetch-data-in-swiftui-2d1d


import Foundation

class CompanyViewModel: ObservableObject {
    @Published var companies: [Company] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        loadBookmarkedCompanies()
    }
    
    func loadBookmarkedCompanies() {
        isLoading = true
        errorMessage = nil
        
        Task { @MainActor in
            do {
                // Simulate network delay
                 try await Task.sleep(nanoseconds: UInt64(3 * Double(NSEC_PER_SEC)))
                let companies = try await WebService().fetchBookmarkedCompanies()
                self.companies = companies ?? []
            } catch {
                errorMessage = "Failed to load bookmarked companies: \(error.localizedDescription)"
            }
            isLoading = false
        }
    }
    
    // TODO: - Only use this func before api endpoints are setup
    func fetchDummyData() async {
        self.companies = Company.dummyData
    }
    
}
