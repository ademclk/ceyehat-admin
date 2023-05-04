//
//  AirportDetailView.swift
//  ceyehat-admin
//
//  Created by Adem Onur Çelik on 3.05.2023.
//

import SwiftUI

struct AirportDetailView: View {
    let airport: Airport
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text(airport.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom)
            
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Id:")
                        .fontWeight(.semibold)
                    Text(airport.id)
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Şehir Id:")
                        .fontWeight(.semibold)
                    Text(airport.cityId)
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("IATA Kodu:")
                        .fontWeight(.semibold)
                    Text(airport.iataCode)
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("ICAO Kodu:")
                        .fontWeight(.semibold)
                    Text(airport.icaoCode)
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Enlem:")
                        .fontWeight(.semibold)
                    Text("\(airport.latitude)")
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Boylam:")
                        .fontWeight(.semibold)
                    Text("\(airport.longitude)")
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Zaman Dilimi:")
                        .fontWeight(.semibold)
                    Text(airport.timezone)
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Oluşturulduğu Tarih:")
                        .fontWeight(.semibold)
                    Text("\(airport.createdAt)")
                        .foregroundColor(.gray)
                }
                HStack {
                    Text("Güncellendiği Tarih:")
                        .fontWeight(.semibold)
                    Text("\(airport.updatedAt)")
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

struct AirportDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let airport = Airport(id: "Test", name: "Test", cityId: "Test", iataCode: "Test", icaoCode: "Test", latitude: 30.0, longitude: 30.0, timezone: "GMT+03:00", departureFlights: [], arrivalFlights: [], createdAt: Date(), updatedAt: Date())
        AirportDetailView(airport: airport)
    }
}
