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
        Task {
            // await fetchCompanies()
            await fetchDummyData()
        }
    }

    func fetchCompanies() async {
        isLoading = true
        errorMessage = nil
        
        guard let url = URL(string: "http://localhost:5000/api/company/<user_id>") else {
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
            self.companies = try JSONDecoder().decode([Company].self, from: data)
            
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
            self.companies = Company.dummyData
            self.isLoading = false
        }
    }
    
}
