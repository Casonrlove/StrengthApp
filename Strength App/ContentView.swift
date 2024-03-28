

import SwiftUI

struct ContentView: View {
    @StateObject var templateWorkoutsViewModel = TemplateWorkoutsViewModel()

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
