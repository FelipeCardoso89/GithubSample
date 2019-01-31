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
    
    private var loadedRepositories: [Repository]?
    private var isLoading: Bool = false
    
    var delegate: RepositoriesViewModelDelegate?
    
    var loading: Bool {
        return isLoading
    }
    
    var repositories: [Repository]? {
        return loadedRepositories
    }
    
    func fetchRepositories() {
        
        isLoading = true
        RepositoriesService.shared.searchRepositories(from: "swift", sortedBy: "stars") { [weak self] (result) in
            
            guard let weakSelf = self else {
                return
            }
            
            switch(result){
            case let .success(repositories):
                weakSelf.loadedRepositories = repositories
                weakSelf.delegate?.didFetchRepositories()
                
            case .failure(_):
                weakSelf.loadedRepositories = nil
            }
            
            weakSelf.isLoading = false
        }
        
    }
    
}
