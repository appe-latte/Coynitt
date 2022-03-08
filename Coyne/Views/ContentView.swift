//
//  ContentView.swift
//  Coyne
//
//  Created by Stanford L. Khumalo on 08/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                            .tabItem {
                                Label("Home", systemImage: "house.fill")
                            }
            
            MainView()
                            .tabItem {
                                Label("Payments", systemImage: "arrow.left.arrow.right")
                            }
            
            MainView()
                            .tabItem {
                                Label("Profile", systemImage: "person.crop.circle.fill")
                            }
            
            MainView()
                            .tabItem {
                                Label("Settings", systemImage: "line.3.horizontal")
                            }
        }
        .accentColor(cynGreen)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
