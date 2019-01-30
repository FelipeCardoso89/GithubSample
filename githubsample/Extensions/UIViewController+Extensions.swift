//
//  UIViewController+Extensions.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController: ViewConfiguration {}

extension ViewConfiguration where Self: UIViewController {
    
    func setupConstraints() {}
    func buildViewHierarchy() {}
    func configureViews() {}
}
