//
//  ModelsTests.swift
//  githubsampleTests
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import githubsample

class ModelsTests: QuickSpec {
    
    var repositorySearch: RepositorySearch?
    var firstRepository: Repository?
    
    override func spec() {
        
        describe("Model creation from API data") {
            
            context("Decode from json") {
                
                beforeEach {
                    
                    guard
                        let path = Bundle(for: type(of: self)).path(forResource: "repositories", ofType: "json"),
                        let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    else {
                        return
                    }
                    
                    self.repositorySearch = try? JSONDecoder().decode(RepositorySearch.self, from: data)
                    self.firstRepository = self.repositorySearch?.repositories.first
                }
                
                
                it("Can create a search repositories model") {
                    expect(self.repositorySearch?.totalCounts).to(equal(514140))
                    expect(self.repositorySearch?.incompleteResults).to(equal(false))
                    expect(self.repositorySearch?.repositories.count).to(equal(30))
                }
                
                it("Can create respository object") {
                    expect(self.firstRepository?.id).to(equal(22458259))
                    expect(self.firstRepository?.name).to(equal("Alamofire"))
                    expect(self.firstRepository?.stars).to(equal(30050))
                    expect(self.firstRepository?.description).to(equal("Elegant HTTP Networking in Swift"))
                }
                
                it("Can create respository author object") {
                    expect(self.firstRepository?.owner.id).to(equal(7774181))
                    expect(self.firstRepository?.owner.login).to(equal("Alamofire"))
                    expect(self.firstRepository?.owner.avatar?.absoluteString).to(equal("https://avatars3.githubusercontent.com/u/7774181?v=4"))
                }
            }
            
            context("Encode to json") {
                
                it("Can encode Author") {
                    let author = Author(id: 1234, login: "author", avatar: nil)
                    let authorEncode = try? JSONEncoder().encode(author)
                    expect(authorEncode).toNot(beNil())
                }
                
                it("Can encode Repository") {
                    let author = Author(id: 1234, login: "author", avatar: nil)
                    let repository = Repository(id: 1234, name: "My Repository", description: "My repo description", stars: 5678, owner: author)
                    let repositoryEncode = try? JSONEncoder().encode(repository)
                    expect(repositoryEncode).toNot(beNil())
                }
                
                it("Can encode search repository object") {
                    
                    let author = Author(id: 1234, login: "author", avatar: nil)
                    let repository = Repository(id: 1234, name: "My Repository", description: "My repo description", stars: 5678, owner: author)
                    let repositorySearch = RepositorySearch(totalCounts: 1234, incompleteResults: false, repositories: [repository])
                    let encoded = try? JSONEncoder().encode(repositorySearch)
                    expect(encoded).toNot(beNil())
                }
            }
        }
        
        describe("Can create Network Models") {
        
            
        }
    }
}
