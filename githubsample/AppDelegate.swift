//
//  AppDelegate.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private lazy var mainCoordinator: MainCoordinator = {
        return MainCoordinator(window: self.window!)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        
        mainCoordinator.start()
        return true
    }
}

