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
    
    private var loadedRepositories = [Repository]()
    
    var repositories: [Repository] {
        return loadedRepositories
    }
    
    func fetchRepositories() {
        
    }
    
}
