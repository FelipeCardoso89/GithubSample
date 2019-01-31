//
//  NetworkResponse.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

struct NetworkResponse {
    let code: Int?
    let data: Data?
    let headers: [AnyHashable: Any]?
    
    init(code: Int?, data: Data?, headers: [AnyHashable: Any]?) {
        self.code = code
        self.data = data
        self.headers = headers
    }
}

extension NetworkResponse {
    
    public static func empty() -> NetworkResponse {
        return NetworkResponse(
            code: nil,
            data: nil,
            headers: nil
        )
    }
}
