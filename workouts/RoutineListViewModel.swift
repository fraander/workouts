//
//  RoutineListViewModel.swift
//  workouts
//
//  Created by Frank Anderson on 1/4/23.
//

import Foundation

class RoutineListViewModel: ObservableObject {
    private var repo = RoutineRepository.shared
    @Published var routines: [W_Routine] = RoutineRepository.shared.routines
    
    func addRoutine() {
        print("add from vm")
        repo.add(W_Routine())
    }
    
    func deleteRoutine(_ routine: W_Routine) {
        routines.removeAll { routine.id == $0.id }
        repo.remove(routine)
    }
}
