//
//  CompanyView.swift
//  bluehire-frontend
//
//  Created by Tze Yi Tiong on 11/22/24.
//

import SwiftUI

struct CompanyView: View {
    var title = "Walmart"
    var reviewsData: [ReviewCard] = ReviewCard.dummyData
    @State var name: String = ""
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
            
            Divider()
                .frame(height: 1)
                .background(Color.cyan)
                .padding(.leading)
            
            Text("Reviews:")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                
            
            ScrollView {
                reviews
                    .padding(.leading)
            }
            
            HStack {
                TextField("Enter your review", text: $name)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(">") {
                    print("clicked")
                }
                .padding()
            }
        }
    }
    
    var reviews: some View {
        VStack {
            ForEach(reviewsData) { reviewData in
                ReviewCardView(title: reviewData.title,
                               subtitle: reviewData.subtitle,
                               text: reviewData.text,
                               cards: reviewData.cards)
            }
        }
        
    }
    
}

#Preview {
    CompanyView()
}
