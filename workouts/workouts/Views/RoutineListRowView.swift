//
//  RoutineListRowView.swift
//  workouts
//
//  Created by Frank Anderson on 1/5/23.
//

import SwiftUI

struct RoutineListRowView: View {
    @ObservedObject private var vm: RoutineListRowViewModel
    
    init(routine: W_Routine) {
        self.vm = RoutineListRowViewModel(routine)
    }
    
    var body: some View {
        NavigationLink(value: vm.routine) {
            VStack(alignment: .leading, spacing: 0) {
                Text(vm.routine.name)
                    .font(.headline)
                    .fontWidth(.expanded)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                if !vm.routine.details.isEmpty {
                    Text(vm.routine.details)
                        .font(.body)
                        .fontDesign(.rounded)
                        .fontWeight(.regular)
                        .lineLimit(3)
                        .minimumScaleFactor(0.8)
                        .foregroundColor(.secondary)
                }
            }
            .badge(vm.routine.exercises.count > 0 ? vm.routine.exercises.count : 0)
        }
    }
}

struct RoutineListRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            List(0..<10) { (num: Int) in
                RoutineListRowView(routine: W_Routine.exampleLong)
                RoutineListRowView(routine: W_Routine.exampleShort)
                RoutineListRowView(routine: W_Routine.exampleNormal)
            }
            .navigationDestination(for: W_Routine.self) { routine in
                Text(routine.name)
            }
        }
    }
}

/*
 
 static let exampleNormal = W_Routine(
 name: "Daily Workout",
 details: "This is a normal daily morning workout.",
 exercises: W_Exercise.examples)
 
 */
