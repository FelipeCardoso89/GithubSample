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
    private var currentPage: Int = 1
    private var totalPages: Int = 1
    
    var delegate: RepositoriesViewModelDelegate?
    
    var loading: Bool {
        return isLoading
    }
    
    var repositories: [Repository]? {
        return loadedRepositories
    }
    
    init(service: RepositoriesServiceable) {
        self.service = service
    }
    
    func fetchRepositories() {
        fetchRepositories(at: 0)
    }
    
    func fetchNextPage() {
        
        guard currentPage < totalPages else {
            return
        }
        
        fetchRepositories(at: currentPage + 1)
    }
    
    func fetchPreviousPage() {
        
        guard currentPage > 0 else {
            return
        }
        
        fetchRepositories(at: currentPage - 1)
    }
    
    func fetchRepositories(at page: Int) {
        
        isLoading = true
        service.searchRepositories(from: "swift", sortedBy: "stars", page: page) { [weak self] (result) in
            
            guard let weakSelf = self else {
                return
            }
            
            switch(result){
            case let .success(searchResult):
                weakSelf.totalPages = searchResult.totalPages ?? 1
                weakSelf.loadedRepositories = searchResult.repositories
                weakSelf.delegate?.didFetchRepositories()
                
            case .failure(_):
                weakSelf.loadedRepositories = nil
            }
            
            weakSelf.isLoading = false
            weakSelf.currentPage = page
        }
    }
}
