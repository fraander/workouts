//
//  ContentView.swift
//  workouts
//
//  Created by Frank Anderson on 1/2/23.
//

import SwiftUI

struct ContentView: View {
    @State var nav = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $nav) {
            RoutineListView()
                .navigationDestination(for: W_Routine.self) { routine in
                    Text("Name: " + routine.name)
                }
                .navigationDestination(for: W_Exercise.self) { exercise in
                    Text(exercise.details[ExerciseDetailKeys.name.rawValue] ?? "UNK")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
