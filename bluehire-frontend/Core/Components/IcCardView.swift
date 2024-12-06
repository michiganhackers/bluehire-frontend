//
//  lcCards.swift
//  bluehire-frontend
//
//  Created by Danish Imran on 10/26/24.
//
//  This is the card view for leetcode

import SwiftUI

struct lcCardView: View {
    var lcCard : lcCard // Accepts the difficulty level as a parameter
        
    // Computed property to set the background color based on difficulty
    private var backgroundColor: Color {
        switch lcCard.difficulty.lowercased() {
        case "easy":
            return .green
        case "medium":
            return .orange
        case "hard":
            return .red
        default:
            return .gray // Default color if difficulty doesn't match
        }
    }
    
    var body: some View {
        VStack() {
            Text(lcCard.text)
                .font(.system(size: 11, weight: .semibold))
                .foregroundColor(Color.white)
                .padding([.horizontal], 10)
                .padding([.vertical], 3)
        }
        .background(backgroundColor)
        .cornerRadius(5)
    }
}

#Preview {
    lcCardView(lcCard : lcCard(text: "test", difficulty: "easy"))
}
