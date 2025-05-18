//
//  ContentView.swift
//  swift-medication-tracker
//
//  Created by Alexandra Prasser on 5/15/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        TabView {
            MedicationsListView().tabItem {
                Label("Medications", systemImage: "pills")
            }
            
            CalendarView().tabItem {
                Label("Calendar", systemImage: "calendar")
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Medication.self, inMemory: true)
}
