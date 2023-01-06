//
//  Navigation.swift
//  workouts
//
//  Created by Frank Anderson on 1/4/23.
//

import SwiftUI

// TODO: find source of "Publishing changes from within view updates is not allowed, this will cause undefined behavior." warning message

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
