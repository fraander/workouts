//
//  Data.swift
//  workouts
//
//  Created by Frank Anderson on 1/2/23.
//

import Foundation

/// I tried using protocols for polymorphism. It's a first attempt at extending knowledge from Object-oriented Design class which is Java-based, before any specific formal reading about using the concepts with structs and protocols.

/// Describes an activity to do at the gym. Either a workout or a more general item.
protocol P_W_Activity: Identifiable {
    var id: UUID { get }
    var name: String { get set }
    var description: String { get set }
}

/// Describes a reps-based exercise
protocol P_W_RepsExercise: P_W_Activity {
    var reps: Int { get set }
    var sets: Int { get set }
}

/// Describes a time based exercise with on and off times.
protocol P_W_TimeExercise: P_W_Activity {
    var time: Int { get set }
    var rest: Int { get set }
}

/// Describes a session at the gym where you go through a set of activities in a specified order.
protocol P_W_Routine: Identifiable {
    var id: UUID { get }
    var activites: [any P_W_Activity] { get set }
}

/// Represents an activity at the gym.
struct W_Activity: P_W_Activity {
    var id = UUID()
    var name: String
    var description: String
}

/// Represents a reps based exercise at the gym.
struct W_RepsExercise: P_W_RepsExercise {
    var id = UUID()
    var name: String
    var reps: Int
    var sets: Int
    var description: String
}

/// Represents a trip to the gym.
struct W_Routine {
    var id = UUID()
    var activites: [any P_W_Activity]
}
