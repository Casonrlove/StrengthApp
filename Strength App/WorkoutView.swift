import SwiftUI

struct WorkoutView: View {
    @State private var templateName = ""
    @State private var newExercise = ""
    @State private var exercises: [String] = []
    @ObservedObject var templateWorkoutsViewModel = TemplateWorkoutsViewModel()

    var body: some View {
        VStack {
            TextField("Template Name", text: $templateName)
                .padding()

            List {
                ForEach(exercises, id: \.self) { exercise in
                    Text(exercise)
                }
                .onDelete(perform: deleteExercise)
            }

            HStack {
                TextField("Exercise", text: $newExercise)
                    .padding()

                Button(action: addExercise) {
                    Text("Add Exercise")
                }
            }
            .padding()

            Button("Save Template") {
                templateWorkoutsViewModel.addTemplateWorkout(name: templateName, exercises: exercises)
                templateName = ""
                exercises.removeAll()
            }
            .padding()
        }
    }

    func addExercise() {
        if !newExercise.isEmpty {
            exercises.append(newExercise)
            newExercise = ""
        }
    }

    func deleteExercise(at offsets: IndexSet) {
        exercises.remove(atOffsets: offsets)
    }
}
