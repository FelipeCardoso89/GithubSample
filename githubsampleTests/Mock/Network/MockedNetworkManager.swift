//
//  MockedNetworkManager.swift
//  githubsampleTests
//
//  Created by Felipe Antonio Cardoso on 31/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation
@testable import githubsample


class MockedNetworkManager {
    
}

extension MockedNetworkManager: NetworkingManageable {
    func request(endpoint: NetworkEndpoint, forceRequest: Bool, completion: @escaping ResponseCompletionResult) {
        if let path = Bundle.main.path(forResource: "repositories", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["person"] as? [Any] {
                    // do stuff
                }
            } catch {
                // handle error
            }
        }
    }
}
