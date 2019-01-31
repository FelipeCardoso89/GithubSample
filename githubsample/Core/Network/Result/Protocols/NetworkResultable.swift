//
//  NetworkResultable.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

public protocol NetworkResultable {
    
    associatedtype Value
    associatedtype Error: Swift.Error
    
    init(value: Value)
    init(error: Error)
    
}

public extension NetworkResult {
    
    public var value: Value? {
        switch self {
        case let .success(value):
            return value
        case .failure:
            return nil
        }
    }
    
    public var error: Error? {
        switch self {
        case .success:
            return nil
        case let .failure(error):
            return error
        }
    }
}
