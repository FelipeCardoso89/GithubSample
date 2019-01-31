//
//  String+Extensions.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

extension String {
    
    func appendParametersAsQueryString(parameters: [String: Any]) -> String {
        let queryString = parameters.map({ "\($0.key)=\($0.value)" }).joined(separator: "&")
        return [self, queryString].joined(separator: "?")
    }
    
    func slice(from: String, to: String) -> String? {
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}
