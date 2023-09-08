//
//  ContentView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 08/03/2022.
//

import SwiftUI
import Combine
import LocalAuthentication
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    @State private var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    @State private var isHide = false
    @State private var isLoading = false
    @Namespace var animation
    
    @State private var selectedTab = 0
    
    @EnvironmentObject var viewModel : AuthViewModel
    @StateObject var appLockModel = AppLockViewModel()
    
    init() {
        // MARK: Nav Bar
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.backgroundColor = UIColor(Color(red: 248 / 255, green: 248 / 255, blue: 248 / 255))
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
        // MARK: Tab Bar
        let tabBarTintColor = UITabBarAppearance()
        tabBarTintColor.configureWithOpaqueBackground()
        tabBarTintColor.shadowColor = .clear
        tabBarTintColor.backgroundColor = UIColor.init(Color(red: 96 / 255, green: 184 / 255, blue: 181 / 255))
        tabBarTintColor.selectionIndicatorTintColor = UIColor.init(Color(red: 96 / 255, green: 184 / 255, blue: 181 / 255))
        UITabBar.appearance().scrollEdgeAppearance = tabBarTintColor
        UITabBar.appearance().standardAppearance = tabBarTintColor
        UITabBar.appearance().barTintColor = UIColor.init(Color(red: 255 / 255, green: 209 / 255, blue: 155 / 255))
        
        UITableView.appearance().backgroundColor = UIColor(Color(red: 248 / 255, green: 248 / 255, blue: 248 / 255))
        UITableViewCell.appearance().backgroundColor = UIColor(Color(red: 248 / 255, green: 248 / 255, blue: 248 / 255))
        UITextView.appearance().backgroundColor = UIColor(Color(red: 248 / 255, green: 248 / 255, blue: 248 / 255))
  
    }
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(spacing: 0) {
            switch selectedTab {
            case 0: MainView()
            case 1: TransactionView()
                    .environmentObject(TransactionViewModel())
            case 2: AccountView()
            case 3: RecipientsView()
            case 4: SettingsView()
            default: Text("Not found")
            }
            
            // MARK: Custom Tab Bar
            ZStack {
                
                Rectangle()
                    .fill(cynWhite)
                    .frame(width: screenWidth, height: 90)
                    .cornerRadius(20, corners: [.topRight, .topLeft])
                
                HStack {
                    tabItem(icon: "home", selectedIcon: "home-dark",  text: "Home", index: 0)
                    Spacer()
                    
                    tabItem(icon: "calendar", selectedIcon: "calendar-dark",text: "Transactions", index: 1)
                    Spacer()
                    
                    tabItem(icon: "wallet", selectedIcon: "wallet-dark",text: "Account", index: 2)
                    Spacer()
                    
                    tabItem(icon: "users", selectedIcon: "users-dark",text: "Recipients", index: 3)
                    Spacer()
                    
                    tabItem(icon: "settings", selectedIcon: "settings-dark",text: "Settings", index: 4)
                }
                .padding(.horizontal, 30)
                .frame(height: 60)
            }
        }
        .background(cynOlive)
        .ignoresSafeArea(.all, edges: .bottom)
        
    }
    
    private func tabItem(icon: String, selectedIcon: String, text: String, index: Int) -> some View {
        Button(action: {
            selectedTab = index
        }) {
            VStack {
                Circle()
                    .fill(selectedTab == index ? cynBlack : cynWhite)
                    .frame(width: 7, height: 7)
                    .clipShape(Circle())
                
                Image(selectedTab == index ? selectedIcon : icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(cynOlive)
                
                Text(text)
                    .font(.system(size: 8))
                    .foregroundColor(cynBlack)
                    .textCase(.uppercase)
                    .kerning(2)
            }
        }
    }
}

// MARK: Loading View struct
struct ProgressLoadingView: View {
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Rectangle()
                    .aspectRatio(contentMode: .fill)
                    .background(cynApricot)
                    .frame(width: geo.size.width, height: geo.size.height)
            }
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                ProgressView()
                    .frame(width: 60, height: 60)
                    .progressViewStyle(CircularProgressViewStyle(tint: cynRed))
                    .scaleEffect(2)
                
                Text("Please Wait")
                    .font(.system(size: 10))
                    .foregroundColor(cynBlack)
                    .textCase(.uppercase)
                    .kerning(2)
                
            }
            .frame(width: 80, height: 100)
            .background(cynWhite)
            .cornerRadius(10)
        }
    }
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
