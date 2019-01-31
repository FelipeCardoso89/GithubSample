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
    
    private var loadedRepositories: [Repository] = [
        Repository(
            id: "bla",
            name: "Alamofire",
            stars: 123456,
            owner: Author(id: "bla", login:"Fodaum!!!", avatar: nil)
        ),
        Repository(
            id: "bla",
            name: "Alamofire",
            stars: 123456,
            owner: Author(id: "bla", login:"Fodaum!!!", avatar: nil)
        ),
        Repository(
            id: "bla",
            name: "Alamofire",
            stars: 123456,
            owner: Author(id: "bla", login:"Fodaum!!!", avatar: nil)
        ),
    ]
    
    var repositories: [Repository] {
        return loadedRepositories
    }
    
    func fetchRepositories() {
        
    }
    
}
