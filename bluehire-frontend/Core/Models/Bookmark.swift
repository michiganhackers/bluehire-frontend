//
//  CompanyTracker.swift
//  bluehire-frontend
//
//  Created by Tiong Tze Yi on 28/09/2024.
//

import Foundation

struct Company: Identifiable, Decodable {
    var id: Int
    var company_name: String
    var time_stamp: Date
    
    // MARK: - dummy data
    static let dummyData: [Company] = [
        Company(id: 1, company_name: "Microsoft", time_stamp: Date()),
        Company(id: 2, company_name: "Netflix", time_stamp: Date()),
        Company(id: 3, company_name: "Amazon", time_stamp: Date()),
        Company(id: 4, company_name: "Databricks", time_stamp: Date())
    ]
}


