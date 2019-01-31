//
//  RepositoriesService.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

public class RepositoriesService {
    
    static var shared: RepositoriesService = {
        return RepositoriesService(manager: NetworkManager())
    }()
    
    private let manager: NetworkingManageable
    
    private init(manager: NetworkingManageable) {
        self.manager = manager
    }
    
    func searchRepositories(from language: String, sortedBy sort: String, completion: @escaping ResponseRepositoriesCompletionResult) {
        
        manager.request(endpoint: RepositoriesEndpoint.repositories(language: language, sort: sort), forceRequest: false) { (result) in
            switch(result) {
            case let .success(response):
                
                guard let data = response.data else {
                    completion(ResponseRepositoriesResult(value: []))
                    return
                }
                
                guard let searchResult = try? JSONDecoder().decode(RepositorySearch.self, from: data) else {
                    completion(ResponseRepositoriesResult(value: []))
                    return
                }
                
                completion(ResponseRepositoriesResult(value: searchResult.repositories))
                
            case .failure(_):
                completion(ResponseRepositoriesResult(error: ResponseNetworkError.unknow))
            }
            
            return
        }
    }
}
