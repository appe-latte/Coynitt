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
                                Label("Main", systemImage: "rectangle.3.group.fill")
                            }
            
            PaymentsView()
                            .tabItem {
                                Label("Transactions", systemImage: "arrow.left.arrow.right.square")
                            }
            
            MainView()
                            .tabItem {
                                Label("Recipients", systemImage: "person.3.fill")
                            }
            
            MainView()
                            .tabItem {
                                Label("More", systemImage: "ellipsis")
                            }
        }
        .accentColor(cynRed)
    }
}
