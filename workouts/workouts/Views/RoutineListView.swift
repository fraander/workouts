//
//  RoutineListView.swift
//  workouts
//
//  Created by Frank Anderson on 1/4/23.
//

import SwiftUI

struct RoutineListView: View {
    @StateObject var nav = NavigationWrapper()
    @ObservedObject private var vm = RoutineRepository.shared
    
    var body: some View {
        NavigationStack(path: $nav.path) {
            VStack {
                List(vm.routines) { routine in
                    RoutineListRowView(routine: routine)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { nav.sheet = .settings } label: { Text("Settings") }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { nav.sheet = .addRoutine } label: { Text("Add Routine") }
                }
            }
            .navigationDestination(for: W_Routine.self) { routine in
                RoutineDetailView(routine: routine)
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

struct RoutineListView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineListView()
    }
}
