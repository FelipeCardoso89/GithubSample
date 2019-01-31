//
//  Author.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct Author {
    
    let id: Int
    let login: String
    let avatar: URL?
}

extension Author: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatar = "avatar_url"
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(login, forKey: .login)
        try container.encode(avatar, forKey: .avatar)
    }
    
    public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.init(
            id: try values.decode(Int.self, forKey: .id),
            login: try values.decode(String.self, forKey: .login),
            avatar: try values.decodeIfPresent(URL.self, forKey: .avatar)
        )
    }
}
