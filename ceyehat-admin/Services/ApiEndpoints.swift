//
//  ApiEndpoints.swift
//  ceyehat-admin
//
//  Created by Adem Onur Çelik on 3.05.2023.
//

import Foundation

struct ApiEndpoints {
    
    static let BASE_URL = "http://localhost:5228/api"
    static let GET_AIRPORTS = "/Airport"
    
    func getBaseUrl() -> String {
        return ApiEndpoints.BASE_URL
    }
    
    func airportEndpoint() -> String {
        return ApiEndpoints.GET_AIRPORTS
    }
}
