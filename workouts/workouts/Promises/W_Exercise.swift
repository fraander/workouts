//
//  W_Exercise.swift
//  workouts
//
//  Created by Frank Anderson on 1/3/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

/// Represents an activity at the gym.
struct W_Exercise: Codable, Identifiable, Equatable, Hashable {
    
    @DocumentID var id: String?
    private(set) var details: [String: String]
    
    init() {
        details = [:]
    }
    
    /// Add or modify a detail
    /// - Parameters:
    ///   - key: the detail to update
    ///   - value: the vaule to change it to
    mutating func addDetail(key: ExerciseDetailKeys, value: String) {
        self.details[key.rawValue] = value
    }
}

enum ExerciseDetailKeys: String {
    
    case name = "name"
    case details = "details"
    case timeOn = "time_on"
    case timeOff = "time_off"
    case sets = "sets"
    case reps = "reps"
    
}
