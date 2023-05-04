//
//  AirportView.swift
//  ceyehat-admin
//
//  Created by Adem Onur Çelik on 3.05.2023.
//

import SwiftUI

struct AirportView: View {
    @StateObject private var viewModel = AirportViewModel()
    
    @State private var selectedAirport: Airport?
    @State private var isEditing = false
    @State private var isAdding = false
    
    var body: some View {
        NavigationView {
            List(selection: $selectedAirport) {
                ForEach(viewModel.airports) { airport in
                    Text(airport.name)
                        .tag(airport)
                }
                .onDelete(perform: deleteAirport)
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 250)
            .navigationTitle("Havalimanları")
            .toolbar {
                Button(action: fetchAirports) {
                    Label("Yenile", systemImage: "arrow.clockwise")
                }
                Button(action: addAirport) {
                    Label("Ekle", systemImage: "plus")
                }
                Button(action: editAirport) {
                    Label("Düzenle", systemImage: "pencil")
                }
            }
            .onAppear(perform: fetchAirports)
            
            if let airport = selectedAirport {
                AirportDetailView(airport: airport)
            } else {
                Text("Bir havalimanı seçin.")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(minWidth: 800, minHeight: 600)
        .sheet(isPresented: $isAdding) {
            CreateAirportView().environmentObject(viewModel)
        }

    }
    
    private func fetchAirports() {
        viewModel.fetchAirports()
    }
    
    private func addAirport() {
        isAdding = true
    }
    
    private func deleteAirport(offsets: IndexSet) {
        
    }
    
    private func editAirport() {
        isEditing.toggle()
    }
}

struct AirportView_Previews: PreviewProvider {
    static var previews: some View {
        AirportView()
    }
}

