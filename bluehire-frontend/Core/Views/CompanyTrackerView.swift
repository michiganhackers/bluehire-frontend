//
//  CompanyTrackerView.swift
//  bluehire-frontend
//
//  Created by Tiong Tze Yi on 27/09/2024.
//

import SwiftUI

struct CompanyTrackerView: View {
    let primaryColor = Color("AppPrimaryColor")
    let names = ["Microsoft", "Netflix", "Amazon", "Databricks"]
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
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
    
    
    // MARK: - Components
    var header: some View {
        VStack {
            Text("Companies Applied")
            Text("Date")
        }
    }
    
    var searchBar: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { name in
                    NavigationLink {
                        Text(name)
                    } label: {
                        Text(name)
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
            Button("+ Upload CSV") { }
                .foregroundColor(.black)
                .buttonStyle(.borderedProminent)
                .tint(primaryColor)
        }
    }
    
    var index: some View {
        HStack {
            Text("1 2 3 4")
            Spacer()
            Button("+ Add") { }
                .foregroundColor(.white)
                .buttonStyle(.borderedProminent)
                .tint(.black)
        }
        .padding()
    }
    
    // MARK: Helper components
    var searchResults: [String] {  // For searchBar
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
    
    
    
    
}



#Preview {
    CompanyTrackerView()
}
