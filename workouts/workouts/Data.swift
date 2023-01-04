//
//  Data.swift
//  workouts
//
//  Created by Frank Anderson on 1/2/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

/// Represents an activity at the gym.
struct W_Exercise: Codable, Identifiable, Equatable {
    
    @DocumentID var id: String?
    var userId: String?
    private(set) var details: [String: String]
    
    mutating func setUserId(_ id: String) {
        self.userId = id
    }
    
    mutating func addDetail(key: ExerciseDetailsKeys, value: String) {
        self.details[key.rawValue] = value
    }
}

enum ExerciseDetailsKeys: String {
    
    case name = "name"
    case details = "details"
    case timeOn = "time_on"
    case timeOff = "time_off"
    case sets = "sets"
    case reps = "reps"
    
}

/// Represents a trip to the gym.
struct W_Routine: Codable, Identifiable, Equatable {
    
    @DocumentID var id: String?
    var userId: String?
    var exercises: [W_Exercise]
    
    mutating func setUserId(_ id: String) {
        self.userId = id
    }
}
