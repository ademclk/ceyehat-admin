//
//  AirportListView.swift
//  ceyehat-admin
//
//  Created by Adem Onur Çelik on 3.05.2023.
//

import SwiftUI

struct AirportListView: View {
    @StateObject private var viewModel = AirportViewModel()
    
    var body: some View {
        List(viewModel.airports, id: \.id) { airport in
            Text(airport.name)
        }
        .onAppear(perform: viewModel.fetchAirports)
    }
}

struct AirportListView_Previews: PreviewProvider {
    static var previews: some View {
        AirportListView()
    }
}
