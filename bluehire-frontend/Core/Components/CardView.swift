//
//  Card.swift
//  bluehire-frontend
//
//  Created by Danish Imran on 10/24/24.
//

import SwiftUI

struct CardView: View {
    
    var title : String
    var subtitle : String
    var text : String
    var cards : [lcCard]
    
    var body: some View {
        VStack(alignment: .leading) {
                // Example Image at the top of the card
            HStack() {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 13, weight: .bold))
                        .italic()
                    Text(subtitle)
                        .font(.system(size: 11, weight: .semibold))
                }
                .foregroundColor(.primary)
                
                // TODO: Insert date uploaded

            }
            .padding([.top, .horizontal])
                
            // Card Content
            Text(text)
                .font(.system(size: 10))
                .foregroundColor(.secondary)
                .lineLimit(4)
                .truncationMode(.tail)
                .padding([.horizontal, .top])
            
            // TODO: insert see more action
            
            HStack() {
                ForEach(cards.prefix(3), id: \.text) { card in
                    lcCardView(lcCard: card)
                }
                
                // Render an additional card if there are more than 3 items
                if cards.count > 3 {
                    lcCardView(lcCard: lcCard(text: "+\(cards.count - 3)", difficulty: "none"))
                }
            }
            .padding()
            
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 5) // Shadow to make the card stand out
        .padding([.horizontal, .bottom])
    }
}

#Preview {
    CardView(title: "Software Engineering Intern",
             subtitle: "OA @ Microsoft",
             text: "This is a description of the card content. You can add more information here to give details.This is a description of the card content. You can add more information here to give details.This is a description of the card content. You can add more information here to give details.This is a description of the card ",
             cards: lcCard.dummyData)
}
