//
//  MedicationsListView.swift
//  swift-medication-tracker
//
//  Created by Alexandra Prasser on 5/18/25.
//

import SwiftUI
import SwiftData

struct MedicationsListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Medication]
    @State private var showAddMedicationView = false
    
    var body: some View {
        /*
         General display for all added medications, showing medication name and dose.
         The toolbar displays the edit option for deleting medications, and the plus button,
         for adding new medications by navigating to the AddMedicationView
         */
        NavigationStack {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        MedicationDetailView(med: item)
                    } label: {
                        Text("\(item.name), Dose: \(item.dose)")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {showAddMedicationView = true}) {
                        Label("Add Medication", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Medications").font(.system(size:30))
                }
            }
            .sheet(isPresented: $showAddMedicationView) {
                AddMedicationView()
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}
