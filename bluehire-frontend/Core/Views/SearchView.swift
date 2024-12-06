//
//  SearchView.swift
//  bluehire-frontend
//
//  Created by Tze Yi Tiong on 12/6/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    let companies = ["Microsoft", "Netflix", "Umich", "Petronas", "Apple"]
    
    var filteredCompanies: [String] {
        searchText.isEmpty ? companies :
            companies.filter { $0.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        NavigationView {
            List(filteredCompanies, id: \.self) { company in
                NavigationLink(destination: CompanyView()) {
                    Text(company)
                }
            }
            .searchable(text: $searchText, prompt: "Search companies")
        }
    }
}

#Preview {
    SearchView()
}
