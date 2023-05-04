//
//  Airport.swift
//  ceyehat-admin
//
//  Created by Adem Onur Çelik on 2.05.2023.
//

import Foundation

struct Airport: Hashable, Codable, Identifiable {
    let id: String
    let name: String
    let cityId: String
    let iataCode: String
    let icaoCode: String
    let latitude: Double
    let longitude: Double
    let timezone: String
    let departureFlights: [Flight?]
    let arrivalFlights: [Flight?]
    let createdAt: Date
    let updatedAt: Date
    
    private enum CodingKeys: String, CodingKey {
        case id, name, cityId, iataCode, icaoCode, latitude, longitude, timezone, departureFlights, arrivalFlights, createdAt, updatedAt
    }
    
    init(id: String, name: String, cityId: String, iataCode: String, icaoCode: String, latitude: Double, longitude: Double, timezone: String, departureFlights: [Flight?], arrivalFlights: [Flight?], createdAt: Date, updatedAt: Date) {
        self.id = id
        self.name = name
        self.cityId = cityId
        self.iataCode = iataCode
        self.icaoCode = icaoCode
        self.latitude = latitude
        self.longitude = longitude
        self.timezone = timezone
        self.departureFlights = departureFlights
        self.arrivalFlights = arrivalFlights
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        cityId = try container.decode(String.self, forKey: .cityId)
        iataCode = try container.decode(String.self, forKey: .iataCode)
        icaoCode = try container.decode(String.self, forKey: .icaoCode)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        timezone = try container.decode(String.self, forKey: .timezone)
        
        departureFlights = try container.decodeIfPresent([Flight?].self, forKey: .departureFlights) ?? []
        arrivalFlights = try container.decodeIfPresent([Flight?].self, forKey: .arrivalFlights) ?? []
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let createdAtString = try container.decode(String.self, forKey: .createdAt)
        createdAt = dateFormatter.date(from: createdAtString)!
        
        let updatedAtString = try container.decode(String.self, forKey: .updatedAt)
        updatedAt = dateFormatter.date(from: updatedAtString)!
    }
}
