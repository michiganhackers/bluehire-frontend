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
    @State private var showReviewForm = false
    
    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .bold()
            
            Divider()
                .frame(height: 2)
                .background(Color.cyan)
                .padding(.leading)
            
            HStack {
                Text("Reviews:")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Spacer()
                Image(systemName: "bookmark")
                    .padding()
            }
            
            ScrollView {
                reviews
                    .padding(.leading)
            }
            
            
            Button("Write a Review") {
                showReviewForm = true
            }
            .padding()
            .background(.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
            
        }
        .sheet(isPresented: $showReviewForm) {
            createReview()
        }
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


struct createReview: View {
    @State private var reviewTitle: String = ""
    @State private var reviewText: String = ""
    
    @State private var selectedTags: Set<String> = []
    @State private var selectedLeetCode: String = ""
    
    @State private var showTagSelector: Bool = false
    @State private var showLeetCodeSelector: Bool = false
    
    @State private var tagAnchor: PopoverAttachmentAnchor = .rect(.bounds)
    @State private var leetCodeAnchor: PopoverAttachmentAnchor = .rect(.bounds)
    
    
    let leetCodeQuestions = [
        "1. Two Sum", "2. Add Two Numbers", "3. Longest Substring Without Repeating Characters",
        "4. Median of Two Sorted Arrays", "5. Longest Palindromic Substring",
        "20. Valid Parentheses", "21. Merge Two Sorted Lists", "53. Maximum Subarray"
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            // Title
            TextField("Review Title...", text: $reviewTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom)
            
            // Buttons
            HStack {
                // Tags button
                Button(action: { showTagSelector = true }) {
                    Label("Tag", systemImage: "tag")
                }
                .buttonStyle(.bordered)
                .popover(isPresented: $showTagSelector, attachmentAnchor: tagAnchor) {
                    TagSelectorPopover(selectedTags: $selectedTags)
                        .presentationCompactAdaptation(.popover)
                }
                
                // LeetCode button
                Button(action: { showLeetCodeSelector = true }) {
                    Label("LeetCode", systemImage: "list.number")
                }
                .buttonStyle(.bordered)
            }
            .padding(.bottom)
            
            // Review text area
            Text("Review")
                .font(.headline)
            TextEditor(text: $reviewText)
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .border(Color.gray.opacity(0.3))
            
            Spacer()
            
            // Submit button
            Button(action: { submitReview() }) {
                Text("Submit Review")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
    
    func submitReview() {
        print("Submitted review:")
        print("Title: \(reviewTitle)")
        print("Content: \(reviewText)")
        print("Selected tags: \(selectedTags)")
        print("LeetCode question: \(selectedLeetCode)")
    }
}


// Tag selector popover
struct TagSelectorPopover: View {
    @Binding var selectedTags: Set<String>
    
    // Predefined tags
    let availableTags = [
        "Quantum", "Machine Learning", "Cloud", "Networks",
        "Web Systems", "Database", "Dev Ops"
    ]
    
    let columns = [GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 5)]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Select Tags")
                .font(.headline)
                .padding()
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(availableTags, id: \.self) { tag in
                        Button(action: {
                            if selectedTags.contains(tag) {
                                selectedTags.remove(tag)
                            } else {
                                selectedTags.insert(tag)
                            }
                        }) {
                            Text(tag)
                                .font(.system(size: 12, weight: .semibold))
                                .padding(.vertical, 6)
                                .padding(.horizontal, 10)
                                .background(selectedTags.contains(tag) ? Color.purple.opacity(1) : Color.purple.opacity(0.6))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .frame(width: 200, height: 250)
        }
    }
}


// LeetCode selector popup with search
struct LeetCodeSelectorView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedQuestion: String
    let questions: [String]
    @State private var searchText = ""
    
    var filteredQuestions: [String] {
        if searchText.isEmpty {
            return questions
        } else {
            return questions.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // Search field
                TextField("Search questions", text: $searchText)
                    .padding(7)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                List {
                    ForEach(filteredQuestions, id: \.self) { question in
                        Button(action: {
                            selectedQuestion = question
                            dismiss()
                        }) {
                            HStack {
                                Text(question)
                                Spacer()
                                if selectedQuestion == question {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        .foregroundColor(.primary)
                    }
                }
            }
            .navigationTitle("LeetCode Questions")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}


//struct createReview: View {
//    @State var reviewTitle: String = ""
//    @State var reviewText: String = ""
//    @State var selectedTags: Set<String> = []
//    @State var showTagSelector: Bool = false
//    @State var selectedLeetcode: Set<String> = []
//    @State var showLeetcodeSelector: Bool = false
//
//    // Predefined tags the user can choose from
//    let availableTags = [
//        "Quantum", "ML", "Cloud", "DSA",
//        "LeetCode Easy", "LeetCode Medium", "LeetCode Hard",
//        "Algorithms", "Data Structures", "System Design"
//    ]
//
//    let leetCodeQuestions = [
//        "1. Two Sum", "2. Add Two Numbers", "3. Longest Substring Without Repeating Characters",
//        "4. Median of Two Sorted Arrays", "5. Longest Palindromic Substring",
//        "20. Valid Parentheses", "21. Merge Two Sorted Lists", "53. Maximum Subarray"
//    ]
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            // Title
//            TextField("Review Title..", text: $reviewTitle)
//              .textFieldStyle(RoundedBorderTextFieldStyle())
//              .padding(.bottom)
//
//            // Tags
//            HStack {
//                // Topics
//                Button(action: {
//                    showTagSelector.toggle()
//                }) {
//                    Label("Tag", systemImage: "tag")
//                }
//                .buttonStyle(.bordered)
//
//                // Leetcode question
//                Button(action: {
//                    showTagSelector.toggle()
//                }) {
//                    Image("leetcode")
//                }
//                .buttonStyle(.bordered)
//            }
//
//
//            // Review text area
//            Text("Review")
//                .font(.headline)
//            TextEditor(text: $reviewText)
//                .frame(maxWidth: .infinity)
//                .frame(height: 200)
//                .border(Color.gray.opacity(0.3))
//
//            Spacer()
//
//            // Submit button
//            Button(action: {
//                submitReview()
//            }) {
//                Text("Submit Review")
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//            }
//        }
//    }
//
//    func submitReview() {
//        print("Submitted review:", reviewText)
//        print("Selected tags:", selectedTags)
//    }
//}
//
//
//struct tagButton: View {
//    let tag: String
//    let backgroundColor: Color
//    
//    var body: some View {
//        Button {
//            print("clicked tag \(tag)")
//        } label: {
//            Text(tag)
//                .padding(.horizontal, 12)
//                .padding(.vertical, 6)
//                .foregroundColor(Color.white)
//                .background(backgroundColor)
//                .cornerRadius(15)
//        }
//    }
//}


#Preview {
    CompanyView()
}
