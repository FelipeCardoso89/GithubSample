//
//  NetworkTask.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

public enum NetworkTask {
    
    case requestPlain
    
    case requestParameters(_ parameters: [String: Any])
    
    case requestCompositeBodyData(data: Data,_ parameters: [String: Any])
}
