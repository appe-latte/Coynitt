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
                                Label("Crypto", systemImage: "dollarsign.circle.fill")
                            }
            
            MainView()
                            .tabItem {
                                Label("Help", systemImage: "questionmark.circle")
                            }
            
            MainView()
                            .tabItem {
                                Label("More", systemImage: "ellipsis")
                            }
        }
        .accentColor(cynGreen)
    }
}
