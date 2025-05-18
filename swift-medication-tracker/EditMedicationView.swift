//
//  EditMedicationView.swift
//  swift-medication-tracker
//
//  Created by Alexandra Prasser on 5/18/25.
//

import SwiftUI
import SwiftData

struct EditMedicationView: View {
    
    @Bindable var med: Medication
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        // Form allows for editing the details of an existing medication
        Form {
            Section {
                HStack(alignment: .top) {
                    Text("Medication Name: ")
                    TextField("Enter Medication", text: $med.name)
                }
                
                HStack(alignment: .top) {
                    Text("Medication Dosage: ")
                    TextField("Enter Dosgae", text: $med.dose)
                }
                
                DatePicker("Medication Time: ", selection: $med.time, displayedComponents: [.date, .hourAndMinute])
                    .datePickerStyle(.graphical)
            }
            
            Section {
                HStack {
                    Spacer()
                    Button("Save Changes") {
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
        
    }
}
