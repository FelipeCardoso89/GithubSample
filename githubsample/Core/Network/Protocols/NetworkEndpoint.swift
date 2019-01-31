//
//  NetworkEndpoint.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

protocol NetworkEndpoint {
    
    static var defaultHeader: [String: String]? { get }
    
    var baseURL: URL? { get }
    
    var path: String { get }
    
    var task: NetworkTask { get }
    
    var method: NetworkMethod { get }
    
    var headers: [String: String]? { get }
}

extension NetworkEndpoint {
    
    static var defaultHeader: [String: String]? {
        return nil
    }
    
    var baseURL: URL? {
        return nil
    }
    
    //The enpoint path. i.e: "/profile/{{ui_id}}/edit"
    var path: String {
        return ""
    }
    
    //How the parameters should be manipulated
    var task: NetworkTask {
        return .requestPlain
    }
    
    //Enpoint method
    var method: NetworkMethod {
        return .get
    }
    
    //Enpoint headers
    var headers: [String: String]? {
        return nil
    }
}

extension NetworkEndpoint {
    
    public func createURL() -> URL? {
        
        guard let baseURL = self.baseURL else {
            return nil
        }
        
        switch self.task {
        case .requestPlain:
            return baseURL.appendingPathComponent(self.path)
            
        case let .requestParameters(parameters):
            
            switch self.method {
            case .get:
                return createURL(from: baseURL, and: self.path, withQueryStringFrom: parameters)
            default:
                return baseURL.appendingPathComponent(self.path)
            }
            
        case let .requestCompositeBodyData(_, urlParameters):
            return createPath(from: baseURL, and: self.path, withQueryStringFrom: urlParameters)
        }
    }
    
    public func createRequest() -> NSMutableURLRequest? {
        
        guard let url = createURL() else {
            return nil
        }
        
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = method.name
        request.httpBody = createBody()
        headers?.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        return request
    }
}

extension NetworkEndpoint {
    
    private func createBody() -> Data? {
        
        switch task {
        case .requestPlain:
            return nil
            
        case let .requestCompositeBodyData(data, _):
            return data
            
        case let .requestParameters(parameters):
            
            switch method {
            case .get:
                return nil
            default:
                return try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            }
        }
    }
    
    private func createURL(from baseURL: URL, and path: String, withQueryStringFrom parameters: [String: Any]) -> URL {
        
        let path = createPath(from: baseURL, and: path, withQueryStringFrom: parameters).absoluteString
        
        guard
            let decodedPath = path.removingPercentEncoding,
            let url = URL(string: decodedPath)
            else {
                return baseURL
        }
        
        return url
    }
    
    private func createPath(from baseURL: URL, and path: String, withQueryStringFrom parameters: [String: Any]) -> URL {
        let pathWithQuery = path.appendParametersAsQueryString(parameters: parameters)
        return baseURL.appendingPathComponent(pathWithQuery)
    }
}
