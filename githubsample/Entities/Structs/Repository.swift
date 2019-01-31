//
//  Repository.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct Repository {
    let id: String
    let name: String
    let stars: Int
    let owner: Author
}

extension Repository: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case stars = "stargazers_count"
        case owner
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(stars, forKey: .stars)
    }
    
    public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.init(
            id: try values.decode(String.self, forKey: .id),
            name: try values.decode(String.self, forKey: .name),
            stars: try values.decode(Int.self, forKey: .stars),
            owner: try values.decode(Author.self, forKey: .owner)
        )
    }
}
