//
//  NetworkingManageable.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

protocol NetworkingManageable {
    func request(endpoint: NetworkEndpoint, forceRequest: Bool, completion: @escaping ResponseCompletionResult)
}
