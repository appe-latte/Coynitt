//
//  ContentView.swift
//  Coynitt
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
            
            TransactionView()
                .tabItem {
                    Label("History", systemImage: "calendar")
                }
            
            CardView()
                .tabItem {
                    Label("Account", systemImage: "creditcard")
                }
            
            MainView()
                .tabItem {
                    Label("Recipients", systemImage: "person.2.fill")
                }
            
            MainView()
                .tabItem {
                    Label("Menu", systemImage: "ellipsis")
                }
        }
        .accentColor(cynGreen)
    }
}
