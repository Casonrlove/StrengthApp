//
//  ContentView.swift
//  Strength App
//
//  Created by Cason Love on 3/22/24.

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to My App")
                    .font(.title)
                    .padding()
                
                NavigationLink(destination: DetailView()) {
                    Text("Go to Detail Page")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .navigationBarTitle("Strength App")
//            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Detail Page")
                .font(.title)
                .padding()
            
            Spacer()
        }
        .navigationBarTitle("Detail")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
