//
//  XCTestCase+Extensions.swift
//  githubsampleUITests
//
//  Created by Henrique Cardoso on 03/02/2019.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import XCTest
import KIF

extension XCTestCase {
    func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
    
    func system(file : String = #file, _ line : Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}
