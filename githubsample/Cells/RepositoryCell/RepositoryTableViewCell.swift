//
//  RepositoryTableViewCell.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(forAutoLayout: ())
        return label
    }()
    
    lazy var authorView: AuthorView = {
        let view = AuthorView(forAutoLayout: ())
        return view
    }()
    
    
    
}
