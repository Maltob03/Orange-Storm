//
//  Orange_StormApp.swift
//  Orange_Storm
//
//  Created by Matteo Altobello on 24/10/22.
//

import SwiftUI

@main
struct Orange_StormApp: App {
    @StateObject var myEvents = EventStore(preview: true)
    
    var body: some Scene {
        WindowGroup {
            MainPageView()
                .environmentObject(myEvents)
        }
    }
}
