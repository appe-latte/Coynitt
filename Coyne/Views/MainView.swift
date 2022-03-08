//
//  MainView.swift
//  Coyne
//
//  Created by Stanford L. Khumalo on 08/03/2022.
//

import SwiftUI

struct MainView: View {
    @State private var accNum : String = "373812093"
    @State var fName = "Samuel"
    
    init() {
        // MARK: Nav Bar
        let barTintColor = UINavigationBarAppearance()
        barTintColor.configureWithOpaqueBackground()
        barTintColor.backgroundColor = UIColor.init(Color(red: 241 / 255, green: 242 / 255, blue: 237 / 255))
        barTintColor.titleTextAttributes = [.foregroundColor: UIColor(Color.black)]
        barTintColor.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.black)]
        UINavigationBar.appearance().scrollEdgeAppearance = barTintColor
        UINavigationBar.appearance().standardAppearance = barTintColor
        UITableView.appearance().backgroundColor = UIColor(Color(red: 241 / 255, green: 242 / 255, blue: 237 / 255))
        
        // MARK: Tab Bar
        let tabBarTintColor = UITabBarAppearance()
        tabBarTintColor.configureWithOpaqueBackground()
        tabBarTintColor.backgroundColor = UIColor.init(Color(red: 241 / 255, green: 242 / 255, blue: 237 / 255))
        UITabBar.appearance().scrollEdgeAppearance = tabBarTintColor
        UITabBar.appearance().standardAppearance = tabBarTintColor
    }
    
    let dummyActivity = [
        Activity(activDate: "07-Mar", activName: "Shell Garage", activAmount: 35.19),
        Activity(activDate: "07-Mar", activName: "Hotel Artes", activAmount: 54.38),
        Activity(activDate: "05-Mar", activName: "KLM Airlines", activAmount: 939.99),
        Activity(activDate: "05-Mar", activName: "Footlocker", activAmount: 129.99),
        Activity(activDate: "05-Mar", activName: "Marsch*PayPal", activAmount: 526.87),
        Activity(activDate: "01-Mar", activName: "Niko's Pizza", activAmount: 32.29),
        Activity(activDate: "27-Feb", activName: "Shopper's Drug Mart", activAmount: 74.99),
        Activity(activDate: "18-Feb", activName: "McDonald's", activAmount: 1.99)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                bgWhite()
                VStack {
                    HStack {
                        //                        Image(systemName: "person.crop.circle.fill")
                        //                            .data(url: URL(string: "\(authModel.user?.profileImageUrl ?? "")")!)
                        Image("dummy-image")
                            .resizable()
                            .scaledToFill()
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .frame(width: 40, height: 40)
                            .foregroundColor(cynGreen)
                            .clipShape(Circle())
                        
                        Text("Hi, \(fName)")
                            .font(.custom("Avenir", size: 22))
                            .bold()
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        // MARK: Deposit Money
                        NavigationLink(
                            destination: MainView()){
                                VStack {
                                    Image(systemName: "arrow.down.circle")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .padding(10)
                                        .background(cynGreen.opacity(0.1))
                                        .clipShape(Circle())
                                    Text("Deposit")
                                        .font(.system(size: 11))
                                        .foregroundColor(.black)
                                }
                            }
                        
                        // MARK: Send Money
                        NavigationLink(
                            destination: MainView()){
                                VStack {
                                    Image(systemName: "arrow.right.circle")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .padding(10)
                                        .background(cynGreen.opacity(0.1))
                                        .clipShape(Circle())
                                    Text("Transfer")
                                        .font(.system(size: 11))
                                        .foregroundColor(.black)
                                }
                            }
                        
                        // MARK: Spending Chart
                        NavigationLink(
                            destination: MainView()){
                                VStack {
                                    Image(systemName: "chart.pie.fill")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .padding(10)
                                        .background(cynGreen.opacity(0.1))
                                        .clipShape(Circle())
                                    Text("Spending")
                                        .font(.system(size: 11))
                                        .foregroundColor(.black)
                                }
                            }
                    }
                    .padding()
                    
                    CardView()
                        .frame(height: 150)
                        .foregroundColor(.black).edgesIgnoringSafeArea(.all)
                        .padding(.horizontal)
                    
                    HStack {
                        Text("Current Account: \(accNum)")
                            .font(.custom("Avenir", size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Form {
                        Section(header: Text("All Activity")) {
                            List(dummyActivity) { activity in
                                ActivityRow(activity: activity)
                            }
                        }
                    }.foregroundColor(.black)
                }
                
            }
            .accentColor(cynGreen)
            .navigationBarTitle("Dashboard")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Notifications
                Button(action: {
                    
                }, label: {
                    Image(systemName: "bell.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(10)
                        .foregroundColor(.black)
                        .clipShape(Circle())
                })
            }
            
        }
    }
}

struct Activity: Identifiable {
    let id = UUID()
    let activDate: String
    let activName: String
    let activAmount: Double
}

struct ActivityRow: View {
    var activity: Activity
    
    var body: some View {
        HStack {
            Text(activity.activDate)
                .font(.custom("Avenir", size: 16))
                .fontWeight(.semibold)
                .foregroundColor(.black)
            Text(activity.activName)
                .font(.custom("Avenir", size: 15))
                .fontWeight(.semibold)
                .foregroundColor(.black)
            Spacer()
            Text("\(activity.activAmount, specifier: "%.2f")")
                .font(.custom("Avenir", size: 15))
                .fontWeight(.semibold)
                .foregroundColor(.black)
        }
        .listRowBackground(cynWhite) // list background colour
        .edgesIgnoringSafeArea(.all)
    }
}
