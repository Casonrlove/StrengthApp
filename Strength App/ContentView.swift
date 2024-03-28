

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
