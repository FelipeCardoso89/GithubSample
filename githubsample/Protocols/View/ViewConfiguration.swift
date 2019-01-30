//
//  ViewConfiguration.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

protocol ViewConfiguration {
    
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewConfiguration {
    
    func buildViewHierarchy() {}
    func setupConstraints() {}
    func configureViews() {}
}
