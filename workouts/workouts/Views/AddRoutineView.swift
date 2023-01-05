//
//  AddRoutineView.swift
//  workouts
//
//  Created by Frank Anderson on 1/4/23.
//

import SwiftUI

struct AddRoutineView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var repo = RoutineRepository.shared
    
    @State var name = ""
    @State var details = ""
    @State var exercises = [W_Exercise]()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    addNewRoutine()
                } label: {
                    Text("Add")
                }
            }
            .padding()
            
            Form {
                Section {
                    TextField("Name", text: $name)
                    TextField("Details", text: $details)
                }
                
                List {
                    ForEach(exercises) { exercise in
                        ExerciseListRowView()
                    }
                    
                    Button {
                        addNewExercise()
                    } label: {
                        Text("New Exercise")
                    }
                    
                }
            }
        }
    }
    
    func addNewRoutine() {
        let newRoutine = W_Routine(name: name, details: details, exercises: exercises)
        repo.add(newRoutine)
        dismiss()
    }
    
    func addNewExercise() {
        var newExercise = W_Exercise()
        newExercise.addDetail(key: .name, value: "new")
        exercises.append(newExercise)
    }
}

struct AddRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        AddRoutineView()
    }
}
