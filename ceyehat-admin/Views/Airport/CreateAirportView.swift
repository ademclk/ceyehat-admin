//
//  CreateAirportView.swift
//  ceyehat-admin
//
//  Created by Adem Onur Çelik on 3.05.2023.
//

import SwiftUI
import Combine

struct CreateAirportView: View {
    @EnvironmentObject var viewModel: AirportViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var cityId: String = ""
    @State private var iataCode: String = ""
    @State private var icaoCode: String = ""
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    @State private var timezone: String = ""
    @State private var json: String = ""
    @State private var showJSON: Bool = false
    
    var body: some View {
        VStack {
            Text("Havalimanı Ekle")
                .font(.title)
                .fontWeight(.bold)
            
            if !showJSON {
                Form {
                    TextField("İsim", text: $name)
                    TextField("Şehir ID'si", text: $cityId)
                    TextField("IATA Kodu", text: $iataCode)
                    TextField("ICAO Kodu", text: $icaoCode)
                    TextField("Enlem", text: $latitude)
                    TextField("Boylam", text: $longitude)
                    TextField("Zaman Dilimi", text: $timezone)
                }
                .padding()
                
                HStack {
                    Button("İptal Et") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .padding(.trailing)
                    
                    Button("Ekle") {
                        viewModel.createAirport(
                            name: name,
                            cityId: cityId,
                            iataCode: iataCode,
                            icaoCode: icaoCode,
                            latitude: Double(latitude) ?? 0,
                            longitude: Double(longitude) ?? 0,
                            timezone: timezone
                        )
                        let airport = Airport(id: "", name: name, cityId: cityId, iataCode: iataCode, icaoCode: icaoCode, latitude: Double(latitude) ?? 0, longitude: Double(longitude) ?? 0, timezone: timezone, departureFlights: [], arrivalFlights: [], createdAt: Date(), updatedAt: Date())
                        let encoder = JSONEncoder()
                        encoder.outputFormatting = .prettyPrinted
                        if let data = try? encoder.encode(airport) {
                            if let jsonString = String(data: data, encoding: .utf8) {
                                json = jsonString
                                showJSON = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }
                        }
                    }
                }
                .padding()
            } else {
                Text(json)
                    .padding()
                VStack {
                    ProgressView()
                        .padding()
                    Text("İstek gönderiliyor.")
                }
            }
        }
        .frame(minWidth: 500, minHeight: 400)
        .navigationTitle("Create Airport")
    }
}
