//
//  RepositoriesViewModel.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

protocol RepositoriesViewModelDelegate {
    func didFetchRepositories()
    func didFailToFetchRepositories(with error: Error)
}

class RepositoriesViewModel {
    
    private let service: RepositoriesServiceable
    
    private var loadedRepositories: [Repository]?
    private var isLoading: Bool = false
    private var currentPage: Int = 0
    private var totalPages: Int = 1
    
    var delegate: RepositoriesViewModelDelegate?
    
    var loading: Bool {
        return isLoading
    }
    
    var repositories: [Repository]? {
        return loadedRepositories
    }
    
    var canLoadNextPage: Bool {
        return (currentPage > 0) && (currentPage < totalPages) && !loading
    }
    
    var canLoadPreviousPage: Bool {
        return (currentPage > 0) && !loading
    }
    
    init(service: RepositoriesServiceable) {
        self.service = service
    }
    
    func fethFirstPage() {
        fetchRepositories()
    }
    
    func fetchNextPage() {
        fetchRepositories(at: currentPage + 1)
    }
    
    func fetchPreviousPage() {
        fetchRepositories(at: currentPage - 1)
    }
    
    private func fetchRepositories(at page: Int = 1) {
        
        guard !loading else {
            return
        }
        
        isLoading = true
        service.searchRepositories(from: "swift", sortedBy: "stars", page: page) { [weak self] (result) in
            
            guard let weakSelf = self else {
                return
            }
            
            switch(result){
            case let .success(searchResult):
                weakSelf.currentPage = page
                weakSelf.totalPages = searchResult.totalPages ?? 1
                
                switch page {
                case 1:
                    weakSelf.loadedRepositories = searchResult.repositories
                default:
                    if (weakSelf.loadedRepositories != nil) {
                        weakSelf.loadedRepositories?.append(contentsOf: searchResult.repositories)
                    } else {
                        weakSelf.loadedRepositories = searchResult.repositories
                    }
                }
        
                weakSelf.delegate?.didFetchRepositories()
                
            case let .failure(error):
                weakSelf.delegate?.didFailToFetchRepositories(with: error)
            }
            
            weakSelf.isLoading = false
        }
    }
}
