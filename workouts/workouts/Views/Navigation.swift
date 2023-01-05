//
//  Navigation.swift
//  workouts
//
//  Created by Frank Anderson on 1/4/23.
//

import SwiftUI

class NavigationWrapper: ObservableObject {
    @Published var path = NavigationPath()
    @Published var sheet: SheetType? = nil
    @Published var alert: Alert? = nil
    
    func toRoot() {
        path = NavigationPath()
    }
    
    func dismissSheet() {
        sheet = nil
    }
    
    enum SheetType: Identifiable, CustomStringConvertible {
        var id: String { return description }
        
        case addRoutine
        case addExercise(W_Routine)
        case settings
        
        var description: String {
            switch self {
                    
                case .addRoutine:
                    return "addRoutine"
                case let .addExercise(routine):
                    return routine.id ?? "routine"
                case .settings:
                    return "settings"
            }
        }
    }
}
