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
    
    static var exampleDefault: W_Exercise {
        let ex = W_Exercise()
        return ex
    }
    
    static var exampleJog: W_Exercise {
        var ex = W_Exercise()
        ex.addDetail(key: .name, value: "Jog")
        ex.addDetail(key: .distance, value: "5")
        ex.addDetail(key: .distanceUnit, value: "miles")
        ex.addDetail(key: .pace, value: "7 mi/hr")
        ex.addDetail(key: .details, value: "Take it easy on the jog. Focus on comfortable heart race and breathing pace as well as form.")
        return ex
    }
    
    static var exampleReps: W_Exercise {
        var ex = W_Exercise()
        ex.addDetail(key: .name, value: "Alternating Weighted Lunges")
        ex.addDetail(key: .reps, value: "12")
        ex.addDetail(key: .sets, value: "3")
        return ex
    }
    
    static var exampleTime: W_Exercise {
        var ex = W_Exercise()
        ex.addDetail(key: .name, value: "Short Distance Sprints")
        ex.addDetail(key: .timeOn, value: "90 seconds")
        ex.addDetail(key: .timeOff, value: "15 seconds")
        return ex
    }
    
    static let examples = [exampleDefault, exampleJog, exampleReps, exampleTime]
    
    @DocumentID var id: String?
    private(set) var details: [String: String]
    
    init() {
        details = [:]
    }
    
    /// Add or modify a detail
    /// - Parameters:
    ///   - key: the detail to update
    ///   - value: the vaule to change it to
    // TODO: expand the addDetail function into specific add functions for each kind of detail
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
    case distance = "distance"
    case distanceUnit = "distance_unit"
    case pace = "pace" // TODO: expand this data design more with some error checking
    
}

enum ExerciseDistanceUnits: String {
    case miles = "miles"
    case kilometers = "kilometers"
}
