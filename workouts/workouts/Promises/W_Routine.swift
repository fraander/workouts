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
