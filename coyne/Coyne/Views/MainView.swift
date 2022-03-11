//
//  MainView.swift
//  Coyne
//
//  Created by Stanford L. Khumalo on 08/03/2022.
//

import SwiftUI

struct MainView: View {
    @State private var accNum : Int = 373812093
    @State var fName : String = "Samuel"
    
    @State var rowHeight = 60.0 // sets row height for list
    @State private var showAccountDetailsSheetView = false
    
    // MARK: Card Rotate
    @State var rotationAngleBack = 0.0
    @State var rotationAngleFront = -90.0
    @State var isCardFlipped = false
    
    let width : CGFloat = 200
    let height : CGFloat = 250
    let animationDelay : CGFloat = 0.3
    
    //MARK: Flip Card Function
    func cardAnimation () {
        isCardFlipped = !isCardFlipped
        if isCardFlipped {
            withAnimation(.linear(duration: animationDelay)) {
                rotationAngleBack = 90
            }
            withAnimation(.linear(duration: animationDelay).delay(animationDelay)){
                rotationAngleFront = 0
            }
        } else {
            withAnimation(.linear(duration: animationDelay)) {
                rotationAngleFront = -90
            }
            withAnimation(.linear(duration: animationDelay).delay(animationDelay)){
                rotationAngleBack = 0
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
                        
                        // MARK: Deposit Money View
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
                        
                        // MARK: Send Money View
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
                        
                        // MARK: Spending Chart View
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
                            CardFrontView(width: width, height: height, degree: $rotationAngleBack)
                            CardBackView(width: width, height: height, degree: $rotationAngleFront)
                        }
                        .frame(width: 250, height: 160)
                        
                        // MARK: Information
                        VStack {
                            Button(action: {
                                self.showAccountDetailsSheetView.toggle()
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
                                self.cardAnimation()
                            }, label: {
                                VStack {
                                    Image(systemName: "arrow.triangle.2.circlepath.circle")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .padding(10)
                                        .background(cynGreen.opacity(0.1))
                                        .clipShape(Circle())
                                    if isCardFlipped == true {
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
                                cardAnimation ()
                            }
                            
                            Spacer()
                        }
                        .frame(height: 150)
                        .padding(.trailing, 15)
                    }
                    
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
            .sheet(isPresented: $showAccountDetailsSheetView) {
                AccountDetailsView()
            }
            .accentColor(cynGreen)
            .navigationBarTitle("Dashboard")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "bell.fill") // Notifications button
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
