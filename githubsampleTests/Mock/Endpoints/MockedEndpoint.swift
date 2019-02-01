//
//  MockedEndpoint.swift
//  githubsampleTests
//
//  Created by Felipe Antonio Cardoso on 01/02/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation
@testable import githubsample

enum MockedEndpoint {
    case endpoint1
    case endpoint2
    case endpoint3
    case endpoint4
}

extension MockedEndpoint: NetworkEndpoint {
    
    static var defaultHeader: [String: String]? {
        return nil
    }
    
    var baseURL: URL? {
        return URL(string: "https://api.github.com")
    }
    
    var path: String {
        return "search/repositories"
    }
    
    var task: NetworkTask {
        switch self {
        case .endpoint1, .endpoint4:
            return .requestPlain
        case .endpoint2:
            return .requestParameters(["param1": "value1", "param2": "value2"])
        case .endpoint3:
            return .requestCompositeBodyData(data: Data(), ["param1": "value1", "param2": "value2"])
        }
    }
    
    var method: NetworkMethod {
        switch self {
        case .endpoint1:
            return .get
        case .endpoint2:
            return .post
        case .endpoint3:
            return .put
        case .endpoint4:
            return .delete
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
