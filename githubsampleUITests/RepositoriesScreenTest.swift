//
//  RepositoriesScreenTest.swift
//  githubsampleUITests
//
//  Created by Henrique Cardoso on 03/02/2019.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import XCTest
import KIF

@testable import githubsample

class RepositoriesScreenTest: KIFTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }
    
    override func tearDown() {
        
    }
    
    func testRepositoriesViewController() {
        
        let tableViewIdenfier = "repositories_table_view"
        
        XCTAssertTrue(waitForElementToAppear(self.app.tables[tableViewIdenfier]))
        snapshot("MainRepositoriesScreen")
    }
    
    func waitForElementToAppear(_ element: XCUIElement) -> Bool {
        let predicate = NSPredicate(format: "exists == true")
        let exp = expectation(for: predicate, evaluatedWith: element, handler: nil)
        
        let result = XCTWaiter().wait(for: [exp], timeout: 5)
        return result == .completed
    }
}
