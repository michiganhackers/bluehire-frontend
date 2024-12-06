//
//  FlashcardView.swift
//  bluehire-frontend
//
//  Created by Tze Yi Tiong on 11/14/24.
//
import SwiftUI

struct FlashcardView: View {
    @State private var questions: [String] = [
        "Two Sum", "Valid Palindrome", "Valid Palindrome 2", "Longest Consecutive Sequence"
    ]
    @State private var refreshCards = false
    
    var body: some View {
        ZStack {
            Image("BackgroundImage")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Spacer()
                    Image("Flame")
                    Text("Day 1")

                }
                .font(.title)
                .padding()
                
                Spacer()
                
                ZStack {
                    ForEach(questions, id: \.self) { question in
                        Card(question: question)
                    }
                }
                .id(refreshCards)
                
                Spacer()
                
                Button("Refresh") {
                    refreshCards.toggle()
                }
                .buttonStyle(.borderedProminent)
                .padding()
                
                BottomNavBarView()
            }
        }
    }
}

struct Card: View {
    var question: String
    // Used for dragging card
    @State private var offset = CGSize.zero
    
    // Used for flipping card
    @State private var isFlipped = false
    @State private var rectangleColor = Color.black
    @State private var showTick = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 330, height: 550)
                .cornerRadius(25)
                .foregroundColor(rectangleColor)
            VStack {
                Text(isFlipped ? "Solution" : question)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                Text(isFlipped ? "Problem Solution goes here" : "Problem description goes here." )
                    .foregroundColor(.white)
            }
            .padding()
            .frame(width: 330, height: 550)
            
            // Display the tick only when the background is orange
            if showTick {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
            }
            
        }
        .offset(x: offset.width, y: offset.height)
        // Gesture used for drag/swiping card
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    withAnimation {
                        swipeCard(width: offset.width)
                    }
                }
        )
        // OnTap gesture used to flip card
        .onTapGesture {
            if !isFlipped {
                withAnimation(.easeInOut(duration: 0.2)) {
                    rectangleColor = .orange
                    showTick = true
                }
            }
            
            // Flip card after flashing orange
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeInOut(duration: 0.2)) {
                    rectangleColor = isFlipped ? .black : Color(red: 0.2, green: 0.2, blue: 0.2)
//                    rectangleColor = .black
                    showTick = false
                }
                withAnimation(.spring(duration: 0.5)) {
                    isFlipped.toggle()
                }
            }
        }
    }
    
    func swipeCard(width: CGFloat) {
        switch width {
        case -400...(-100):
            offset = CGSize(width: -500, height: 0)
        case 100...(400):
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }
}


#Preview {
    FlashcardView()
}
