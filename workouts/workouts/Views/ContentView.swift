//
//  ContentView.swift
//  workouts
//
//  Created by Frank Anderson on 1/2/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var nav = NavigationWrapper()
    
    var body: some View {
        NavigationStack(path: $nav.path) {
            RoutineListView()
                .navigationDestination(for: W_Routine.self) { routine in
                    Text("Name: " + routine.name)
                        .toolbar {
                            Button {
                                nav.sheet = .addExercise(routine)
                            } label: {
                                Text("Add Exercise")
                            }

                        }
                }
                .navigationDestination(for: W_Exercise.self) { exercise in
                    Text(exercise.details[ExerciseDetailKeys.name.rawValue] ?? "UNK")
                }
                .sheet(item: $nav.sheet) { sheetType in
                    Group {
                        switch sheetType {
                            case .addRoutine: AddRoutineView()
                            case let .addExercise(routine): Text("add exercise; \(routine.name)")
                            case .settings: Text("settings")
                        }
                    }
                }
                .environmentObject(nav)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
