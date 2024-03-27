//
//  models.swift
//  Strength App
//
//  Created by Jackson Benge on 3/26/24.
//

import Foundation

struct Workout: Hashable {
    var exercise: String
    var weight: Double
    var reps: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(exercise)
        hasher.combine(weight)
        hasher.combine(reps)
    }
    
    static func == (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.exercise == rhs.exercise && lhs.weight == rhs.weight && lhs.reps == rhs.reps
    }
}

struct WorkoutSession: Identifiable, Hashable {
    let id = UUID()
    var date: Date
    var title: String  // Add title property
    var workouts: [Workout]
}
