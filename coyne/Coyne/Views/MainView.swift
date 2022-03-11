//
//  MainView.swift
//  Coyne
//
//  Created by Stanford L. Khumalo on 08/03/2022.
//

import SwiftUI

struct MainView: View {
    @State private var accNum : Int = 373812093
    @State var fName = "Samuel"
    @State var rowHeight = 60.0 // sets row height for list
    
    // MARK: Card Rotate
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false
    
    let width : CGFloat = 200
    let height : CGFloat = 250
    let durationAndDelay : CGFloat = 0.3
    
    //MARK: Flip Card Function
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
    
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
        Activity(activDate: "07-Mar", activName: "Shell Garage", activAmount: -35.19),
        Activity(activDate: "07-Mar", activName: "Hotel Artes", activAmount: -54.38),
        Activity(activDate: "05-Mar", activName: "Deposit -- Marsch*PayPal", activAmount: 526.87),
        Activity(activDate: "04-Mar", activName: "KLM Airlines", activAmount: -939.99),
        Activity(activDate: "02-Mar", activName: "Footlocker", activAmount: -129.99),
        Activity(activDate: "28-Feb", activName: "Deposit -- Appe Latte Ltd", activAmount: 3500.29),
        Activity(activDate: "26-Feb", activName: "Niko's Pizza", activAmount: -32.29)
        
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
                    
                    // MARK: Card Views
                    HStack {
                        ZStack {
                            CardFrontView(width: width, height: height, degree: $backDegree)
                            CardBackView(width: width, height: height, degree: $frontDegree)
                        }
                        .frame(width: 250, height: 160)
                        
                        
                        // MARK: Information
                        VStack {
                            Button(action: {
                                
                            }, label: {
                                VStack {
                                    Image(systemName: "info.circle.fill")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .padding(10)
                                        .background(cynGreen.opacity(0.1))
                                        .clipShape(Circle())
                                    Text("Account Details")
                                        .font(.system(size: 11))
                                        .foregroundColor(.black)
                                }
                            })
                            
                            Button(action: {
                                self.flipCard()
                            }, label: {
                                VStack {
                                    Image(systemName: "arrow.triangle.2.circlepath.circle")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .padding(10)
                                        .background(cynGreen.opacity(0.1))
                                        .clipShape(Circle())
                                    if isFlipped == true {
                                    Text("Card Front")
                                        .font(.system(size: 11))
                                        .foregroundColor(.black)
                                    } else {
                                        Text("Card Back")
                                            .font(.system(size: 11))
                                            .foregroundColor(.black)
                                    }
                                }
                            }).onTapGesture {
                                flipCard ()
                            }
                            
                            Spacer()
                        }
                        .frame(height: 150)
                        .padding(.trailing, 20)
                        
                    }
                    
                    //                    HStack {
                    //
                    //                        // MARK: View Account Details
                    //                        Button(action: {
                    //
                    //                        }, label: {
                    //                            VStack {
                    //                                Image(systemName: "info.circle.fill")
                    //                                    .resizable()
                    //                                    .frame(width: 25, height: 25)
                    //                                    .padding(10)
                    //                                    .background(cynGreen.opacity(0.1))
                    //                                    .clipShape(Circle())
                    //                                Text("Account Details")
                    //                                    .font(.system(size: 11))
                    //                                    .foregroundColor(.black)
                    //                            }
                    //                        })
                    //
                    //                        // MARK: View Card Back
                    //                        Button(action: {
                    //
                    //                        }, label: {
                    //                            VStack {
                    //                                Image(systemName: "arrow.triangle.2.circlepath.circle")
                    //                                    .resizable()
                    //                                    .frame(width: 25, height: 25)
                    //                                    .padding(10)
                    //                                    .background(cynGreen.opacity(0.1))
                    //                                    .clipShape(Circle())
                    //                                Text("Card Back")
                    //                                    .font(.system(size: 11))
                    //                                    .foregroundColor(.black)
                    //                            }
                    //                        })
                    //                    }
                    //                    .frame(height: 150)
                    //                    .padding(.trailing, 20)
                    
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Form {
                        Section(header: Text("Latest Activity")) {
                            List(dummyActivity) { activity in
                                ActivityRow(activity: activity)
                            }
                        }
                    }
                    .foregroundColor(.black)
                    .environment(\.defaultMinListRowHeight, rowHeight)
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
        VStack {
            HStack {
                Text(activity.activName)
                    .font(.custom("Avenir", size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Spacer()
                
                Text("\(activity.activAmount, specifier: "%.2f")")
                    .font(.custom("Avenir", size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            
            HStack {
                Text(activity.activDate)
                    .font(.custom("Avenir", size: 14))
                    .bold()
                    .foregroundColor(.gray)
                
                Spacer()
            }
        }
        .listRowBackground(cynWhite) // list background colour
        .edgesIgnoringSafeArea(.all)
    }
}
