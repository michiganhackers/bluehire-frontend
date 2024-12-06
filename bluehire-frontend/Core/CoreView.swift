//
//  Components.swift
//  bluehire-frontend
//
//  Created by Tiong Tze Yi on 28/09/2024.
//

import SwiftUI

struct CoreView: View {
    private let navigationTabs: [(icon: String, view: AnyView)] = [
        ("house", AnyView(HomeView())),
        ("magnifyingglass", AnyView(SearchView())),
        ("doc", AnyView(FlashcardView())),
        ("bookmark", AnyView(BookmarkView()))
    ]
    
    @State private var selectedTab: String = "house"
    
    var body: some View {
        VStack {
            // Display selected tab
            navigationTabs.first(where: { $0.icon == selectedTab })?.view
            
            Spacer()
            
            // Display bottom navbar
            HStack {
                ForEach(navigationTabs, id: \.icon) { tab in
                    Button(action: {
                        selectedTab = tab.icon
                    }) {
                        Image(systemName: tab.icon)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.black)
                            .frame(width: 24, height: 24)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding()
            .background(Color.white)
            .frame(height: 20)
            .shadow(color: .gray.opacity(0.15), radius: 4, x: 0, y: -13)
        }
    }
}

#Preview {
    CoreView()
}
