//
//  AirportViewModel.swift
//  ceyehat-admin
//
//  Created by Adem Onur Çelik on 3.05.2023.
//

import SwiftUI
import Combine

class AirportViewModel: ObservableObject {
    @Published var airports: [Airport] = []
    @Published var createdAirport: Airport?
    private let apiClient = AirportAPIClient(baseURL: ApiEndpoints().getBaseUrl())
    private var cancellables: Set<AnyCancellable> = []
    
    public func cancelAllRequests() {
        cancellables.forEach { $0.cancel() }
    }
    
    func fetchAirports() {
        apiClient.fetchAirports { [weak self] result in
            switch result {
            case .success(let fetchedAirports):
                DispatchQueue.main.async {
                    self?.airports = fetchedAirports
                }
            case .failure(let error):
                print("Error fetching airports: \(error)")
            }
        }
    }
    
    func createAirport(name: String, cityId: String, iataCode: String, icaoCode: String, latitude: Double, longitude: Double, timezone: String) {
        let airport = Airport(
            id: UUID().uuidString,
            name: name,
            cityId: cityId,
            iataCode: iataCode,
            icaoCode: icaoCode,
            latitude: latitude,
            longitude: longitude,
            timezone: timezone,
            departureFlights: [],
            arrivalFlights: [],
            createdAt: Date(),
            updatedAt: Date()
        )
        
        apiClient.createAirport(airport: airport) { result in
            switch result {
            case .success(let createdAirport):
                DispatchQueue.main.async {
                    self.airports.append(createdAirport)
                }
            case .failure(let error):
                print("Error creating airport: \(error)")
            }
        }
    }
}
