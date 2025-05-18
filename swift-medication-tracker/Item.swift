//
//  Item.swift
//  swift-medication-tracker
//
//  Created by Alexandra Prasser on 5/15/25.
//

import Foundation
import SwiftData

/*
 In Progress: I plan to add more functionality to this struct. I will change the time from a single instance to allow for people to choose the occurance and repitition of medications. Like daily or weekly, with a time being optional. 
 */

// Medication class holding all relevant information: name, dose, and time
@Model
final class Medication {
    var name: String
    var dose: String
    var time: Date
    
    init(name: String, dose: String, time: Date) {
        self.name = name
        self.dose = dose
        self.time = time
    }
}
