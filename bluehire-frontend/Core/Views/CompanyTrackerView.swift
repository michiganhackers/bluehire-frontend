//
//  CompanyTrackerView.swift
//  bluehire-frontend
//
//  Created by Tiong Tze Yi on 27/09/2024.
//

import SwiftUI

struct CompanyTrackerView: View {
    let primaryColor = Color("AppPrimaryColor")

    @StateObject private var vm = CompanyViewModel()
    
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            if vm.isLoading {
                Text("Loading...")
                    .font(.headline)
            } else if let errorMessage = vm.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else if !vm.companies.isEmpty {
                // body view
                Image("BackgroundImage")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    header
                    Divider()
                        .background(Color.black)
                    filter
                    searchBar
                    
                    Spacer()
                    index
                    BottomNavBar()
                }
            }
        }
    }
    
    // MARK: - Components
    var header: some View {
        VStack {
            Text("Companies Bookmarked")
            Text("Date")
        }
    }
    
    var searchBar: some View {
        NavigationStack {
            List {
                ForEach(searchResults) { company in
                    NavigationLink {
                        Text(company.name)
                    } label: {
                        Text(company.name)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .scrollContentBackground(.hidden)
        }
        .searchable(text: $searchText, prompt: "Search")
        .frame(maxHeight: 500)

    }
        
    var filter: some View {
        HStack {
            Text("All |")
            Text("30+ days |")
            Text("90+ days |")
            Text("1+ year")
        }
    }
    
    var index: some View {
        HStack {
            Text("1 2 3 4")
            Spacer()
            Button("+ Add") { }
                .foregroundColor(.black)
                .buttonStyle(.borderedProminent)
                .tint(primaryColor)
        }
        .padding()
    }
    
    // MARK: Helper components
    var searchResults: [Company] {  // For searchBar
        if searchText.isEmpty {
            return vm.companies
        } else {
            return vm.companies.filter { $0.name.contains(searchText) }
        }
    }
}


#Preview {
    CompanyTrackerView()
}
