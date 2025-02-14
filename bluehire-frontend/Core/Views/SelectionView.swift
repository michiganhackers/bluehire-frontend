//
//  TodoCard.swift
//  bluehire-frontend
//
//  Created by Lance Ying on 2/6/25.
//

import Foundation
import SwiftUI


struct TodoCardListView: View {
    
    let todoData: [TodoCard] = TodoCard.dummyData
    
    
    // body
    var body: some View {
        VStack {
            ForEach(todoData) { todo in
                DisplayFashcard(todo: todo)
                    .padding(.bottom, 15)
            }
        }
    }
    
    
}


struct DisplayFashcard: View {
    
    let todo: TodoCard
    
    // Percentage part
    private var progress: CGFloat {
        guard todo.percentage > 0 else { return 0 }
        return CGFloat(todo.percentage) / 100
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(todo.circle_color)
                .frame(width: 350, height: 250)
            
            VStack (alignment: .leading) {
                Text(todo.title)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(todo.text_color)
                    .bold()
                    .padding(.bottom, 10)
                    .padding(.trailing, 60)
                
                progressRing
                    .padding()
            }
            .padding(.leading, -40.0)
        }
    }
    
    var progressRing: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 20)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    AngularGradient(gradient: Gradient(colors: [Color.orange, Color.red, Color.yellow]), center: .center),
                    style: StrokeStyle(lineWidth: 20, lineCap: .butt)
                )
                .rotationEffect(.degrees(-90)) // Align correctly
            
            Text("\(todo.percentage)%")
                .font(.title)
                .foregroundColor(todo.text_color)
                .bold()
        }
        .frame(width: 120, height: 120)
    }
}



#Preview {
    TodoCardListView()
}
