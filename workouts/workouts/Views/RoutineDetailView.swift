//
//  RoutineDetailView.swift
//  workouts
//
//  Created by Frank Anderson on 1/5/23.
//

import SwiftUI

struct RoutineDetailView: View {
    let routine: W_Routine
    
    var body: some View {
        Text("Name: " + routine.name)
    }
}

struct RoutineDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineDetailView(routine: W_Routine.exampleNormal)
    }
}
