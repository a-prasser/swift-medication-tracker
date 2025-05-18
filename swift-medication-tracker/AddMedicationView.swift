//
//  AddMedicationView.swift
//  swift-medication-tracker
//
//  Created by Alexandra Prasser on 5/15/25.
//

import SwiftUI
import SwiftData

struct AddMedicationView: View {
    
    @State private var name = ""
    @State private var dose = ""
    @State private var time = Date()
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Medication]
    
    var body: some View {
        
        // The Form allows the user to register a medication and saves it to the model container
        Form {
            Section {
                HStack(alignment: .top) {
                    Text("Medication Name: ")
                    TextField("Enter Medication", text: $name)
                }
                
                HStack(alignment: .top) {
                    Text("Medication Dosage: ")
                    TextField("Enter Dosgae", text: $dose)
                }
                
                DatePicker("Medication Time: ", selection: $time, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(.graphical)
            }
            
            Section {
                HStack {
                    Spacer()
                    Button("Save") {
                        let newMedication = Medication(name: name, dose: dose, time: time)
                        modelContext.insert(newMedication)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

