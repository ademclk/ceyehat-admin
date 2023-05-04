//
//  AirportAPIClient.swift
//  ceyehat-admin
//
//  Created by Adem Onur Çelik on 3.05.2023.
//

import Foundation

class AirportAPIClient: BaseAPIClient {
    func fetchAirports(completionHandler: @escaping (Result<[Airport], Error>) -> Void) {
        makeAPICall(endpoint: ApiEndpoints().airportEndpoint(), completionHandler: completionHandler)
    }
    
    func createAirport(airport: Airport, completionHandler: @escaping (Result<Airport, Error>) -> Void) {
        guard let body = try? JSONEncoder().encode(airport) else { return }
        makeAPICall(endpoint: ApiEndpoints().airportEndpoint(), method: "POST", body: body, completionHandler: completionHandler)
    }
}
