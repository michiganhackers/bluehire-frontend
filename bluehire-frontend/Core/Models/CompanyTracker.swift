//
//  CompanyTracker.swift
//  bluehire-frontend
//
//  Created by Tiong Tze Yi on 28/09/2024.
//

import Foundation

struct Company: Identifiable, Codable {
    var id: Int
    var name: String
    var date: Date
    
    // MARK: - dummy data
    static let dummyData: [Company] = [
        Company(id: 1, name: "Microsoft", date: Date()),
        Company(id: 2, name: "Netflix", date: Date()),
        Company(id: 3, name: "Amazon", date: Date()),
        Company(id: 4, name: "Databricks", date: Date())
    ]
}
