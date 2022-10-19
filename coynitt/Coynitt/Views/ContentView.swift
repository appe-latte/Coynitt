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
                    Label("Home", image: "home")
                }
            
            TransactionView()
                .tabItem {
                    Label("History", image: "calendar")
                }
            
            CardView()
                .tabItem {
                    Label("Account", image: "wallet")
                }
            
            MainView()
                .tabItem {
                    Label("Recipients", image: "users")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", image: "settings")
                }
        }
        .accentColor(cynGreen)
    }
}
