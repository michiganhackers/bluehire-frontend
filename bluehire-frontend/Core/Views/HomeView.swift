//
//  HomePage.swift
//  bluehire-frontend
//
//  Created by Tiong Tze Yi on 27/09/2024.
//
import SwiftUI

struct HomeView: View {
    var reviewsData: [ReviewCard] = ReviewCard.dummyData
    
    @State var searchText: String = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            header
            
            Text("To-do's")
                .bold()
                .padding(.leading, 15)
            
            TodoCardView()
                .padding(.leading, 15)
            
            Text("What's New?")
                .padding(.leading, 15)
                .bold()
            
            reviews
        }
    }
    
    var header: some View {
        HStack {
            Text("BlueHire")
                .font(.largeTitle)
                .foregroundColor(.cyan)
                .bold()
            Spacer()
            Button(action: {
                print("Hello World")
            }) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }
        }
        .padding()
    }
    
    var reviews: some View {
        VStack {
            ForEach(reviewsData) { reviewData in
                ReviewCardView(title: reviewData.title,
                               subtitle: reviewData.subtitle,
                               text: reviewData.text,
                               lcCards: reviewData.lcCards)
            }
        }
    }
}


#Preview {
    HomeView()
}
