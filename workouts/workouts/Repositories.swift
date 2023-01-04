//
//  Repositories.swift
//  workouts
//
//  Created by Frank Anderson on 1/3/23.
//

import Combine
import FirebaseCore
import FirebaseFirestore

class RoutineRepository: ObservableObject {
    static var shared: RoutineRepository = .init()
    
    @Published var userId = ""
    private let authService = AuthenticationService()
    
    private var cancellables: Set<AnyCancellable> = []
    
    private let routinePath: String = "routine"
    private let store = Firestore.firestore()
    
    @Published var routines: [W_Routine] = []
    
    private init() {
        authService.$user
            .compactMap { user in
                user?.uid
            }
            .assign(to: \.userId, on: self)
            .store(in: &cancellables)
        
        authService.$user
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.getRoutines()
            }
            .store(in: &cancellables)
    }
    
    func getRoutines() {
        store.collection(routinePath)
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting routines: \(error.localizedDescription)")
                    return
                }
                
                self.routines = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: W_Routine.self)
                } ?? []
            }
    }

    func add(_ routine: W_Routine) {
        do {
            var newRoutine = routine
            newRoutine.setUserId(userId)
            _ = try store.collection(routinePath).addDocument(from: newRoutine)
        } catch {
            fatalError("Unable to add: \(error.localizedDescription)")
        }
    }
    
    func update(_ routine: W_Routine) {
        guard let id = routine.id else { return }
        
        do {
            try store.collection(routinePath).document(id).setData(from: routine)
        } catch {
            fatalError("Unable to update: \(error.localizedDescription).")
        }
    }
    
    func remove(_ routine: W_Routine) {
        guard let id = routine.id else { return }
        
        store.collection(routinePath).document(id).delete { error in
            if let error = error {
                print("Unable to delete: \(error.localizedDescription)")
            }
        }
    }
}
