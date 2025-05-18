//
//  MedicationDetailView.swift
//  swift-medication-tracker
//
//  Created by Alexandra Prasser on 5/18/25.
//

import SwiftUI
import SwiftData

struct MedicationDetailView: View {
    
    @Bindable var med: Medication
    @State private var showEditMedicationView = false
    
    var body: some View {
        
        // Displays all stored medication information, with the option to edit the data
        Form {
            Text("Medication: \(med.name)")
            Text("Dose: \(med.dose)")
            Text("Time: \(med.time.formatted(date: .abbreviated, time: .shortened))")
        }
        .toolbar {
            ToolbarItem {
                Button("Edit") {
                    showEditMedicationView = true
                }
            }
            ToolbarItem(placement: .principal) {
                Text("Medication Details").font(.system(size:30))
            }
        }
        .sheet(isPresented: $showEditMedicationView) {
            EditMedicationView(med: med)
        }
    }
}
