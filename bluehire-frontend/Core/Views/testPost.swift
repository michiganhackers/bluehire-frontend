//
//  testPost.swift
//  bluehire-frontend
//
//  Created by Tze Yi Tiong on 2/20/25.
//

import SwiftUI

struct ReviewInput: View {
    @State private var reviewText = ""
    @State private var selectedTags: Set<String> = []
    
    // Predefined tags the user can choose from
    let availableTags = [
        "Quality",
        "Service",
        "Price",
        "Location",
        "Ambiance",
        "Value"
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Review text input
            TextField("Write your review...", text: $reviewText, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(4...6)
                .padding(.horizontal)
            
            // Tags section
            Text("Select tags:")
                .font(.headline)
                .padding(.horizontal)
            
            // Tag selection
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(availableTags, id: \.self) { tag in
                        TagButton(
                            tag: tag,
                            isSelected: selectedTags.contains(tag),
                            action: {
                                if selectedTags.contains(tag) {
                                    selectedTags.remove(tag)
                                } else {
                                    selectedTags.insert(tag)
                                }
                            }
                        )
                    }
                }
                .padding(.horizontal)
            }
            
            // Submit button
            Button(action: {
                submitReview()
            }) {
                Text("Submit Review")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
    
    func submitReview() {
        // Handle the review submission here
        print("Review:", reviewText)
        print("Selected tags:", selectedTags)
    }
}

// Custom tag button component
struct TagButton: View {
    let tag: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(tag)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(15)
        }
    }
}

// Preview
struct ReviewInput_Previews: PreviewProvider {
    static var previews: some View {
        ReviewInput()
    }
}
