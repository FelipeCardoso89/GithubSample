//
//  RepositoriesServiceable.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 31/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

protocol RepositoriesServiceable {
    func searchRepositories(from language: String, sortedBy sort: String, page: Int, completion: @escaping ResponseRepositoriesSearchCompletionResult)
}
