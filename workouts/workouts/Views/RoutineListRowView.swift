//
//  RoutineListRowView.swift
//  workouts
//
//  Created by Frank Anderson on 1/5/23.
//

import SwiftUI

struct RoutineListRowView: View {
    let routine: W_Routine
    
    var body: some View {
        NavigationLink(value: routine) {
            VStack {
                Text(routine.id ?? "nil")
                Text(routine.userId ?? "nil")
                Text("\(routine.exercises.count)")
            }
        }
    }
}

struct RoutineListRowView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineListRowView(routine: W_Routine.exampleNormal)
    }
}
