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
    
    enum SheetType: String, Identifiable {
        var id: Self { return self }
        
        case addRoutine
        case addExercise
        case settings
    }
}
