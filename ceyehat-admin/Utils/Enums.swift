//
//  Enums.swift
//  ceyehat-admin
//
//  Created by Adem Onur Çelik on 3.05.2023.
//

import Foundation

enum SidebarItem: String, CaseIterable, Identifiable {
    case users = "Kullanıcılar"
    case countries = "Ülkeler"
    case cities = "Şehirler"
    case airlines = "Havayolları"
    case airports = "Havalimanları"
    case aircrafts = "Uçaklar"
    case customers = "Müşteriler"
    case flights = "Uçuşlar"
    case seats = "Koltuklar"
    case prices = "Fiyatlar"
    
    var id: String { rawValue }
}
