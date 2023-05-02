//
//  ceyehat_adminApp.swift
//  ceyehat-admin
//
//  Created by Adem Onur Çelik on 2.05.2023.
//

import SwiftUI

@main
struct ceyehat_adminApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
