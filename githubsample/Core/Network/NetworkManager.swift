//
//  NetworkManager.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

class NetworkManager {
    
    public init() {
        
    }
    
    private func execute(request: URLRequest, completion: @escaping ResponseCompletionResult) {
    
        let session: URLSession = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            
            if let _ = error {
                session.finishTasksAndInvalidate()
                completion(ResponseResult(error: ResponseNetworkError.unknow))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                session.finishTasksAndInvalidate()
                completion(ResponseResult(error: ResponseNetworkError.unknow))
                return
            }
            
            let networkResponse = NetworkResponse(
                code: response.statusCode,
                data: data,
                headers: response.allHeaderFields
            )
            
            session.finishTasksAndInvalidate()
            completion(ResponseResult(value: networkResponse))
        })
        
        task.resume()
    }
}

extension NetworkManager: NetworkingManageable {
    
    public func request(endpoint: NetworkEndpoint, forceRequest: Bool = false, completion: @escaping ResponseCompletionResult) {
        
        guard let request = endpoint.createRequest() as URLRequest? else {
            completion(ResponseResult(error: ResponseNetworkError.unknow))
            return
        }
        
        execute(request: request, completion: completion)
    }
}
