//
//  ReviewCard.swift
//  bluehire-frontend
//
//  Created by Tze Yi Tiong on 12/5/24.
//

import Foundation

struct ReviewCard: Identifiable {
    let id: Int
    let title: String
    let subtitle: String
    let text: String
    let lcCards: [lcCard]

    // MARK: - dummy data
    static let dummyData: [ReviewCard] = [
        ReviewCard(id: 1,
                   title: "Software Engineering Intern", subtitle: "OA @ Microsoft",
                   text: "This is a description of the card content. You can add more information here to give details.This is a description of the card content. ",
                   lcCards: lcCard.dummyData),
        ReviewCard(id: 2,
                   title: "Full-Stack Intern", subtitle: "Technical Interview @ Netflix",
                   text: "Lorem ipsum odor amet, consectetuer adipiscing elit. Libero morbi donec ex sapien, aliquam tempor est sodales. Fermentum mi augue nunc pellentesque nunc pretium est eget. Nullam mattis consequat est magna neque lacinia. ",
                   lcCards: lcCard.dummyData),
        ReviewCard(id: 3,
                   title: "Data Analyst Intern", subtitle: "Behavioral @ UMich",
                   text: "Lorem ipsum odor amet, consectetuer adipiscing elit. Libero morbi donec ex sapien, aliquam tempor est sodales. Fermentum mi augue nunc pellentesque nunc pretium est eget. Nullam mattis consequat est magna neque lacinia. ",
                   lcCards: lcCard.dummyData)
        
    ]
}
