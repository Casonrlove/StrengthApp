import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                Text("Track those hoes")
                    .font(.title)
                    .padding()
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(0)
                
                WorkoutView()
                    .tabItem {
                        Image(systemName: "dumbbell")
                        Text("Workout")
                    }
                    .tag(1)
                
                Text("Settings Page")
                    .font(.title)
                    .padding()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    .tag(2)
            }
            .navigationBarTitle("Strength App!")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct WorkoutView: View {
    @State private var workoutSessions: [WorkoutSession] = []
    @State private var selectedDate = Date()
    @State private var isAddingWorkout = false
    @State private var selectedExercise = ""
    @State private var weight = ""
    @State private var reps = ""
    @State private var workoutTitle = ""  // Add state variable for workout title

    var body: some View {
        VStack {
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .padding()
            
            TextField("Workout Title", text: $workoutTitle)  // TextField for workout title
                .padding()
            
            List {
                ForEach(workoutSessions) { session in
                    if Calendar.current.isDate(session.date, inSameDayAs: selectedDate) {
                        Section(header: Text(session.title)) {  // Display workout title as header
                            ForEach(session.workouts, id: \.self) { workout in
                                Text("\(workout.exercise): \(String(format: "%.2f", workout.weight)) lbs, \(workout.reps) reps")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Workouts")

            Button("Add Workout") {
                isAddingWorkout.toggle()
            }
        }
        .sheet(isPresented: $isAddingWorkout) {
            Form {
                Picker("Exercise", selection: $selectedExercise) {
                    Text("Bench Press").tag("Bench Press")
                    Text("Squats").tag("Squats")
                    Text("Deadlifts").tag("Deadlifts")
                }
                TextField("Weight (lbs)", text: $weight)
                    .keyboardType(.numberPad)
                TextField("Reps", text: $reps)
                    .keyboardType(.numberPad)
                Button("Add") {
                    if let weight = Double(weight), let reps = Int(reps) {
                        let newWorkout = Workout(exercise: selectedExercise, weight: weight, reps: reps)
                        if let sessionIndex = workoutSessions.firstIndex(where: { Calendar.current.isDate($0.date, inSameDayAs: selectedDate) }) {
                            workoutSessions[sessionIndex].workouts.append(newWorkout)
                        } else {
                            let newSession = WorkoutSession(date: selectedDate, title: workoutTitle, workouts: [newWorkout])
                            workoutSessions.append(newSession)
                        }
                        isAddingWorkout.toggle()
                    }
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
