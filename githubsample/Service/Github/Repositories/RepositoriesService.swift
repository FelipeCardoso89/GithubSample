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
    
}

extension RepositoriesService: RepositoriesServiceable {
    
    func searchRepositories(from language: String, sortedBy sort: String, page: Int, completion: @escaping ResponseRepositoriesSearchCompletionResult) {
        
        manager.request(endpoint: RepositoriesEndpoint.repositories(language: language, sort: sort, page: page), forceRequest: false) { (result) in
           
            switch(result) {
            case let .success(response):
                
                guard let data = response.data else {
                    completion(ResponseRepositoriesSearchResult(error: ResponseNetworkError.unknow))
                    return
                }
                
                guard var searchResult = try? JSONDecoder().decode(RepositorySearch.self, from: data) else {
                    completion(ResponseRepositoriesSearchResult(error: ResponseNetworkError.unknow))
                    return
                }
                
                if let headers = response.headers {
                    searchResult.totalPages = self.retriveTotalNumberOfPages(from: headers)
                }
            
                completion(ResponseRepositoriesSearchResult(value: searchResult))
                
            case .failure(_):
                completion(ResponseRepositoriesSearchResult(error: ResponseNetworkError.unknow))
            }
            
            return
        }
    }
    
    private func retriveTotalNumberOfPages(from headers: [AnyHashable: Any]) -> Int? {
        
        guard let links = headers["Link"] as? String else {
            return nil
        }
        
        let availableLinks = links.components(separatedBy: ",")
        
        var lastLinkComponents: String = ""

        switch availableLinks.count {
        case 4:
            lastLinkComponents = availableLinks[2]
        default:
            lastLinkComponents = availableLinks.last ?? ""
        }
    
        guard
            let lastLink = lastLinkComponents.components(separatedBy: ";").first,
            let link = lastLink.slice(from: "<", to: ">"),
            let url = URLComponents(string: link),
            let queryItems = url.queryItems,
            let item = queryItems.first(where: { $0.name.elementsEqual("page") }),
            let value = item.value,
            let pages = Int(value)
        else {
            return nil
        }
        
        return pages
    }
    
}
