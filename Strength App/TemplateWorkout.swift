//
//  TemplateWorkout.swift
//  Strength App
//
//  Created by Jackson Benge on 3/28/24.
//

import Foundation

// Define a TemplateWorkout struct
struct TemplateWorkout: Identifiable {
    let id = UUID()
    var name: String
    var exercises: [String]  // For simplicity, only store exercise names for now
}

// ViewModel to manage template workouts
class TemplateWorkoutsViewModel: ObservableObject {
    @Published var templateWorkouts: [TemplateWorkout] = []

    // Function to add a new template workout
    func addTemplateWorkout(name: String, exercises: [String]) {
        let newTemplate = TemplateWorkout(name: name, exercises: exercises)
        templateWorkouts.append(newTemplate)
    }
}
