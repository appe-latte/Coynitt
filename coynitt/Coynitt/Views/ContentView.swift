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
                    Label("Transactions", image: "calendar")
                }
            
            CardView()
                .tabItem {
                    Label("Account", image: "wallet")
                }
            
            RecipientsView()
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

// MARK: Loading View struct
struct ProgressLoadingView: View {
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Rectangle()
                    .aspectRatio(contentMode: .fill)
                    .background(cynGreen)
                    .frame(width: geo.size.width, height: geo.size.height)
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                ProgressView()
                    .frame(width: 60, height: 60)
                    .progressViewStyle(CircularProgressViewStyle(tint: cynPurple))
                    .scaleEffect(2)
                
                Text("Please Wait")
                    .foregroundColor(.black)
                    .font(.system(size: 10))
                    
            }
            .frame(width: 80, height: 100)
            .background(cynWhite)
            .cornerRadius(10)
        }
    }
}
