//
//  TodoView.swift
//  bluehire-frontend
//
//  Created by Tze Yi Tiong on 12/6/24.
//

import SwiftUI

struct TodoCardView: View {
    let title: String = "FlashCards"
    let total: Int = 5
    let completed: Int = 3

    // Calculate percentage for progress bar
    private var progress: CGFloat {
        guard total > 0 else { return 0 }
        return CGFloat(completed) / CGFloat(total)
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.appPrimary)
                .frame(width: 200, height: 85)
            
            HStack {
                progressRing
                    .padding(.trailing, 15)
                
                VStack (alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .bold()
                    Text("\(completed)/\(total)")
                        .foregroundColor(.white)
                        .bold()
                }
            }
        }
    }
    
    var progressRing: some View {
        ZStack {
            // Background Circle
             Circle()
                 .stroke(Color.gray.opacity(0.3), lineWidth: 10)
            
             // Progress Circle
             Circle()
                 .trim(from: 0, to: progress)
                 .stroke(Color.yellow, lineWidth: 10)
                 .rotationEffect(.degrees(-90))
        }
        .frame(width: 40, height: 40)
    }
    
}

#Preview {
    TodoCardView()
}
