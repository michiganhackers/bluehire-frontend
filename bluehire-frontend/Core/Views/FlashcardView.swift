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
    
    var body: some View {
        ZStack {
            Image("BackgroundImage")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Streak")
                    .font(.title)
                    .padding()
                
                Spacer()
                
                ZStack {
                    ForEach(questions, id: \.self) { question in
                        Card(question: question)
                    }
                }
                
                Spacer()
                
//                Button(action: undoSwipe) {
//                    Text("Undo")
//                        .font(.title)
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                .padding()
            }
        }
    }

}

struct Card: View {
    var question: String
    @State private var offset = CGSize.zero
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 320, height: 420)
                .cornerRadius(25)
                .foregroundColor(.black)
            VStack {
                Text(question)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                Text("Problem description goes here.")
                    .foregroundColor(.white)
            }
            .padding()
            .frame(width: 320, height: 420)
        }
        .offset(x: offset.width, y: offset.height)
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
    }
    
    func swipeCard(width: CGFloat) {
        switch width {
        case -400...(-100):
            offset = CGSize(width: -500, height: 0)
        case 100...(400):
            offset = CGSize(width: 500, height: 0)
        default:
            self.offset = .zero
        }
    }
}


#Preview {
    FlashcardView()
}
