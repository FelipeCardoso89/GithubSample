//
//  ViewModelConfigurable.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation
import UIKit

protocol ViewModelConfigurable {
    
    associatedtype ViewModel
    
    func configureWithViewModel(_ model: ViewModel)
    func update()
}

extension ViewModelConfigurable where Self: UIView {
    
    static func configure(with model: ViewModel) -> Self {
        let view = Self.init()
        view.configureWithViewModel(model)
        return view
    }
}
