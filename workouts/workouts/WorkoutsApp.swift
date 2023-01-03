//
//  workoutsApp.swift
//  workouts
//
//  Created by Frank Anderson on 1/2/23.
//

import SwiftUI
import FirebaseCore

@main
struct WorkoutsApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
