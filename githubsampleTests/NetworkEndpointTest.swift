//
//  NetworkEndpointTest.swift
//  githubsampleTests
//
//  Created by Felipe Antonio Cardoso on 31/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import githubsample

class NetworkEndpointTest: QuickSpec {
    
    override func spec() {
        
        describe("Endpoints Tests") {
            
            it("Can create the first endpoint") {
                let endpoint1 = MockedEndpoint.endpoint1
                let url = endpoint1.createURL()
                expect(url).toNot(beNil())
                expect(url?.absoluteString).to(equal("https://api.github.com/search/repositories"))
            }
            
            it("Can create the second endpoint") {
                let endpoint2 = MockedEndpoint.endpoint2
                let url = endpoint2.createURL()
                expect(url).toNot(beNil())
                expect(url?.absoluteString).to(equal("https://api.github.com/search/repositories"))
            }
            
            it("Can create the third endpoint") {
                let endpoint3 = MockedEndpoint.endpoint3
                let url = endpoint3.createURL()
                expect(url).toNot(beNil())
                expect(url?.absoluteString).to(equal("https://api.github.com/search/repositories%3Fparam1=value1"))
            }
            
            it("Can create the fourth endpoin") {
                let endpoint4 = MockedEndpoint.endpoint4
                let url = endpoint4.createURL()
                expect(url).toNot(beNil())
                expect(url?.absoluteString).to(equal("https://api.github.com/search/repositories"))
            }
        }
    }
}
