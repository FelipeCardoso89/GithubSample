//
//  NetworkResult.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

public enum NetworkResult<Value, Error: Swift.Error> {
    case success(Value)
    case failure(Error)
}

extension NetworkResult {
    
    public static var errorDomain: String {
        return "com.nextel.NetworkResult"
    }
    
    public static var functionKey: String {
        return "\(errorDomain).function"
    }
    
    public static var fileKey: String {
        return "\(errorDomain).file"
    }
    
    public static var lineKey: String {
        return "\(errorDomain).line"
    }
    
    public static func error(_ message: String? = nil, function: String = #function, file: String = #file, line: Int = #line) -> NSError {
        
        var userInfo: [String: Any] = [
            functionKey: function,
            fileKey: file,
            lineKey: line,
            ]
        
        if let message = message {
            userInfo[NSLocalizedDescriptionKey] = message
        }
        
        return NSError(domain: errorDomain, code: 0, userInfo: userInfo)
    }
    
}

extension NetworkResult: NetworkResultable {
    
    public init(value: Value) {
        self = .success(value)
    }
    
    public init(error: Error) {
        self = .failure(error)
    }
    
}
