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
            WelcomeView()
        }
        .commands {
            CommandGroup(replacing: CommandGroupPlacement.sidebar) {
                Button("Toggle Sidebar") {
                    if let keyWindow = NSApp.keyWindow,
                       let firstResponder = keyWindow.firstResponder {
                        firstResponder.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
                    }
                }
                .keyboardShortcut("S", modifiers: [.command])
            }
        }
        
        WindowGroup("CreateAirportWindow") {
            CreateAirportView()
        }
    }
}
