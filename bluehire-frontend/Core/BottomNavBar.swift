//
//  Components.swift
//  bluehire-frontend
//
//  Created by Tiong Tze Yi on 28/09/2024.
//

import SwiftUI

struct BottomNavBar: View {
    let primaryColor = Color("AppPrimaryColor")
    let navigationIcons = [
        "house",
        "magnifyingglass",
        "star",
        "person",
        "gear"
    ]
    @State private var hoveredIcon: String?
    
    var body: some View {
        HStack {
            ForEach(navigationIcons, id: \.self) { icon in
                Button(action: {
                    print("Tapped on \(icon)")
                }) {
                    Image(systemName: icon)
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
        .frame(height: 50)
        .shadow(color: .gray.opacity(0.15), radius: 4, x: 0, y: -13)

    }
}

#Preview {
    BottomNavBar()
}
