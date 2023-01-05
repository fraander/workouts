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

/// Represents a trip to the gym.
struct W_Routine: Codable, Identifiable, Equatable, Hashable {
    
    static let exampleShort = W_Routine(
        name: "Daily",
        details: "",
        exercises: [])
    static let exampleNormal = W_Routine(
        name: "Daily Workout",
        details: "This is a normal daily morning workout.",
        exercises: W_Exercise.examples)
    static let exampleLong = W_Routine(
        name: "Super Intense Crazy Long Morning Routine",
        details: "This morning routine takes forever and could use up a whole morning, day, night, and midnight. Only recommended for the most hardcore of atheletes and gym users.",
        exercises: W_Exercise.examples + W_Exercise.examples + W_Exercise.examples)
    
    static let examples = [exampleShort, exampleNormal, exampleLong]
    
    @DocumentID var id: String?
    var userId: String?
    var exercises: [W_Exercise]
    var name: String
    var details: String
    
    init() {
        self.init(exercises: [])
    }
    
    init(name: String = "", details: String = "", exercises: [W_Exercise]) {
        self.userId = RoutineRepository.shared.userId
        self.exercises = exercises
        self.name = name
        self.details = details
    }
    
    mutating func setUserId(_ id: String) {
        self.userId = id
    }
    
    mutating func addExercise(exercise: W_Exercise) {
        exercises.append(exercise)
    }
}
