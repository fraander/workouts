//
//  ContentView.swift
//  workouts
//
//  Created by Frank Anderson on 1/2/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var repo = RoutineRepository.shared
    @State var success = "false"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world! \(success)")
        }
        .padding()
        .task {
            var exercise = W_Exercise(userId: "e_userId", details: [:])
            exercise.addDetail(key: ExerciseDetailsKeys.name, value: "e_name")
            let exercises = [exercise]
            let routine = W_Routine(userId: "r_userId", exercises: exercises)
            repo.add(routine)
            success = "true"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
