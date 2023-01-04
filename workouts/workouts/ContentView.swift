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
            
            Button {
                var exercise = W_Exercise()
                exercise.addDetail(key: ExerciseDetailsKeys.name, value: "e_name")
                var routine = W_Routine()
                routine.addExercise(exercise: exercise)
                repo.add(routine)
                print(repo.routines)
                success = "true"
            } label: {
                Text("Create")
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
