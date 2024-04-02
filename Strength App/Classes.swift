//
//  models.swift
//  Strength App
//
//  Created by Jackson Benge on 3/26/24.
//

import Foundation

//video said struct should have the workouts and we could make a class for the template of workouts?

//Hasher means each workout has an INT value behind the scenes
struct Exercise: Hashable{
    var ExerciseName : String
    var ExerciseWeight : Double
    var ExerciseReps : Int
}

//thinking we can call the workout class to store workouts?
// question would be how to list them... wonder if another array could just be made of the names of the list? idk functionality for the future?

class Workout {
    var WorkoutName : String = ""
    var Exercises : [Exercise] = []
}

