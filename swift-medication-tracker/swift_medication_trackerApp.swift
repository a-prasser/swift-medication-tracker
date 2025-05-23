//
//  swift_medication_trackerApp.swift
//  swift-medication-tracker
//
//  Created by Alexandra Prasser on 5/15/25.
//

import SwiftUI
import SwiftData

@main
struct swift_medication_trackerApp: App {
    
    // Initializes a model container for the Medication struct
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Medication.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
