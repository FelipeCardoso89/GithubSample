//
//  UIRefreshControl+Extensions.swift
//  githubsample
//
//  Created by Henrique Cardoso on 03/02/2019.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation
import UIKit

extension UIRefreshControl {
    
    func beginRefreshingManually() {
        
        guard let scrollView = superview as? UIScrollView else {
            return
        }
        
        let point = CGPoint(x: 0, y: scrollView.contentOffset.y - frame.height)
        scrollView.setContentOffset(point, animated: true)
        beginRefreshing()
        sendActions(for: .valueChanged)
    }
}
