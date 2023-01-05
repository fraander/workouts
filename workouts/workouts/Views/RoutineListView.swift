//
//  RoutineListView.swift
//  workouts
//
//  Created by Frank Anderson on 1/4/23.
//

import SwiftUI

struct RoutineListView: View {
    
    @EnvironmentObject var nav: NavigationWrapper
    @ObservedObject private var vm = RoutineRepository.shared
    
    var body: some View {
        VStack {
            List(vm.routines) { routine in
                NavigationLink(value: routine) {
                    VStack {
                        Text(routine.id ?? "nil")
                        Text(routine.userId ?? "nil")
                        Text("\(routine.exercises.count)")
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    nav.sheet = .settings
                } label: {
                    Text("Settings")
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    nav.sheet = .addRoutine
                } label: {
                    Text("Add Routine")
                }
            }
        }
        
    }
}

struct RoutineListView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineListView()
    }
}
