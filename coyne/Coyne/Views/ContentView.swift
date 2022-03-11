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
            
            PaymentsView()
                            .tabItem {
                                Label("Payments", systemImage: "arrow.left.arrow.right")
                            }
            
            MainView()
                            .tabItem {
                                Label("Trends", systemImage: "chart.bar.xaxis")
                            }
            
            MainView()
                            .tabItem {
                                Label("Help", systemImage: "questionmark.circle")
                            }
            
            MainView()
                            .tabItem {
                                Label("Settings", systemImage: "line.3.horizontal")
                            }
        }
        .accentColor(cynGreen)
    }
}
