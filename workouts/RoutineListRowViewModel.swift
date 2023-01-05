//
//  RoutineListViewModel.swift
//  workouts
//
//  Created by Frank Anderson on 1/4/23.
//

import Foundation

class RoutineListRowViewModel: ObservableObject {
    @Published var routine: W_Routine {
        didSet {
            RoutineRepository.shared.update(routine)
        }
    }
    
    init(_ routine: W_Routine) {
        self.routine = routine
    }
}
