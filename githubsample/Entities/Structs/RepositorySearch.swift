//
//  RepositorySearch.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct RepositorySearch {
    let totalCounts: Int
    let incompleteResults: Bool
    let repositories: [Repository]
    var totalPages: Int?
    
    init(totalCounts: Int, incompleteResults: Bool, repositories: [Repository]) {
        self.totalCounts = totalCounts
        self.incompleteResults = incompleteResults
        self.repositories = repositories
        self.totalPages = nil
    }
}

extension RepositorySearch: Codable {
    
    enum CodingKeys: String, CodingKey {
        case totalCounts = "total_count"
        case incompleteResults = "incomplete_results"
        case repositories = "items"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(totalCounts, forKey: .totalCounts)
        try container.encode(incompleteResults, forKey: .incompleteResults)
        try container.encode(repositories, forKey: .repositories)
    }
    
    public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.init(
            totalCounts: try values.decode(Int.self, forKey: .totalCounts),
            incompleteResults: try values.decode(Bool.self, forKey: .incompleteResults),
            repositories: try values.decode([Repository].self, forKey: .repositories)
        )
    }
}
