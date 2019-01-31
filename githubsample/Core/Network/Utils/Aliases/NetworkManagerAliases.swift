//
//  NetworkManagerAliases.swift
//  githubsample
//
//  Created by Felipe Antonio Cardoso on 30/01/19.
//  Copyright © 2019 Felipe Antonio Cardoso. All rights reserved.
//

import Foundation

//Void
typealias VoidResult = NetworkResult<Void, ResponseNetworkError>
typealias VoidCompletionResult = ((VoidResult) -> Void)

//NetworkResponse
typealias ResponseResult = NetworkResult<NetworkResponse, ResponseNetworkError>
typealias ResponseCompletionResult = ((ResponseResult) -> Void)


