//
//  WelcomeView.swift
//  ceyehat-admin
//
//  Created by Adem Onur Çelik on 2.05.2023.
//

import SwiftUI

struct WelcomeView: View {
    @State private var selectedSidebarItem: SidebarItem?
    
    var body: some View {
        NavigationView {
            List(SidebarItem.allCases, id: \.self, selection: $selectedSidebarItem) { item in
                HStack {
                    Text(item.rawValue)
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button(action: toggleSidebar) {
                        Image(systemName: "sidebar.left")
                    }
                }
            }
            
            if let selectedItem = selectedSidebarItem {
                switch selectedItem {
                case .airports:
                    AirportView()
                    // Add the other cases for different entities here
                default:
                    Text("\(selectedItem.rawValue)")
                }
            } else {
                Text("Menüden seçiminizi yapın.")
            }
        }
        .frame(minWidth: 800, minHeight: 500)
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
    
    private func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
