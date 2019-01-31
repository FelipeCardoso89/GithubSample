//
//  RepositoriesEndpoint.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

enum RepositoriesEndpoint {
    case repositories(language: String, sort: String)
}

extension RepositoriesEndpoint: NetworkEndpoint {
    
    var baseURL: URL? {
        return URL(string: "https://api.github.com/")
    }
    
    var path: String {
        switch self {
        case .repositories:
            return "search/repositories"
        }
    }
    
    var task: NetworkTask {
        switch self {
        case .repositories(let language, let sort):
            return .requestParameters([
                "q": "language:\(language)",
                "sort": sort
            ])
        }
    }
    
    var method: NetworkMethod {
        return .get
    }
    
    public var headers: [String : String]? {
        return nil
    }
}
