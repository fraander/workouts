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
                    .fontWidth(.expanded)
                    .foregroundColor(.accentColor)
                Text(vm.routine.details)
                    .lineLimit(3)
                    .minimumScaleFactor(0.8)
                    .foregroundColor(.secondary)
//                Text("\(vm.routine.exercises.count)")
            }
        }
    }
}

struct RoutineListRowView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            List(0..<10) { num in
                RoutineListRowView(routine: W_Routine.exampleNormal)
                    .id(num)
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
