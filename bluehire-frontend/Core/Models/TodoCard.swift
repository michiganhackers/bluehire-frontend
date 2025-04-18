//
//  TodoCard.swift
//  bluehire-frontend
//
//  Created by Lance Ying on 2/6/25.
//

import Foundation
import SwiftUI

struct TodoCard: Identifiable {
    let id: Int
    let title: String
    let percentage: Int
    let circle_color: Color
    let text_color: Color
    
    static let dummyData: [TodoCard] = [
        TodoCard(id: 1,
                 title: "Leet Code(Hard)",
                 percentage: 70,
                 circle_color: Color(red: 40/255, green: 63/255, blue: 98/255),
                 text_color: Color.white),
        
        TodoCard(id: 2,
                 title: "Machine Learning",
                 percentage: 60,
                 circle_color: Color(red: 255/255, green: 244/255, blue: 143/255),
                 text_color: Color.black)
    
    ]
}
