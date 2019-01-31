//
//  UIView+Extensions.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation
import UIKit

extension UIView: Reusable {}

extension UIView: ViewConfiguration {}

extension UIView: Layoutable {}
extension Layoutable where Self: UIView {
    
    init(forAutoLayout: Void) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}


