

import SwiftUI

struct ContentView: View {
    @StateObject var templateWorkoutsViewModel = TemplateWorkoutsViewModel()
    //put state TemplateWorkoutArray here
    // can be adjusted in other views by passing it in and giving it binding values in other views, that is if we want them to be modified.

    var body: some View {
        NavigationView {
            TabView {
                HomeView(templateWorkoutsViewModel: templateWorkoutsViewModel)
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
                
                SettingsView().tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(2)
            }
            .navigationBarTitle("Saiyan Strength")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
