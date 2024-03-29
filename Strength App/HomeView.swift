//
//  HomeView.swift
//  Strength App
//
//  Created by Jackson Benge on 3/28/24.
//
import SwiftUI
struct HomeView: View {
    @ObservedObject var templateWorkoutsViewModel: TemplateWorkoutsViewModel
    @State private var newTemplateName: String = ""

    var body: some View {
        NavigationView {
            VStack {
                // Title "Template Workouts"
                Text("Template Workouts")
                    .font(.headline)
                    .padding(.top)

                // List of current templates
                ScrollView {
                    ForEach(templateWorkoutsViewModel.templateWorkouts) { template in
                        Text(template.name)
                            .font(.body)
                            .padding(.bottom, 5)
                    }
                }

                // Textfield for new template name
                TextField("Enter Template Name", text: $newTemplateName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                // Add an "Add Template" button
                Button(action: addTemplate) {
                    Text("Add Template")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.top)
                }
                Spacer()
            }
            .navigationBarTitle("Home View")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    // Function to add a new template
    private func addTemplate() {
        guard !newTemplateName.isEmpty else { return }
        templateWorkoutsViewModel.addTemplateWorkout(name: newTemplateName, exercises: []) // assuming exercises are empty initially
        newTemplateName = ""
    }
}

//#Preview {
//    HomeView()
//}
