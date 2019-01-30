//
//  MainCoordinator.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    private let window: UIWindow

    private lazy var repositoriesViewController: RepositoriesViewController = {
        let viewController = RepositoriesViewController()
        viewController.view.backgroundColor = UIColor.blue
        return viewController
    }()
    
    private lazy var rootViewController: UINavigationController = {
        let navigation = UINavigationController(rootViewController: repositoriesViewController)
        return navigation
    }()
    
    init(window: UIWindow) {
        self.window = window
    }
 
    func start() {
        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
    }
}
