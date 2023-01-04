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
struct W_Routine: Codable, Identifiable, Equatable {
    
    @DocumentID var id: String?
    var userId: String?
    var exercises: [W_Exercise]
    
    init() {
        userId = RoutineRepository.shared.userId
        exercises = []
    }
    
    mutating func setUserId(_ id: String) {
        self.userId = id
    }
    
    mutating func addExercise(exercise: W_Exercise) {
        exercises.append(exercise)
    }
}
