//
//  CardView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-10-11.
//

import SwiftUI

struct CardView: View {
    @State private var accNum : Int = 373812093
    @State var fName : String = "Samuel"
    @State private var userTag : String = "samthing90"
    
    @State var rowHeight = 50.0 // sets row height for list
    @State private var showAccountDetailsSheetView = false
    @State private var showDepositSheetView = false
    @State var showAccFreezeAlert = false
    @State var showTransferActiveSheet = false
    @State var isTransferActiveSheetPresented = false
    @State var showDepositActiveSheet = false
    //    @State var transferActivitySheet: TransfersActivitySheet?
    @State var depositActivitySheet: DepositActivitySheet?
    //    @State var actionViewMode = TransfersActivitySheet.bank_tx
    @State private var showQrSheet = false
    
    // MARK: Card Rotate
    @State var rotationAngleBack = 0.0
    @State var rotationAngleFront = -90.0
    @State var isCardFlipped = false
    
    let width : CGFloat = 200
    let height : CGFloat = 250
    let animationDelay : CGFloat = 0.3
    
    //MARK: Flip Card Function
    func cardAnimation() {
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
    
    //    init() {
    //        // MARK: Nav Bar
    //        let barTintColor = UINavigationBarAppearance()
    //        barTintColor.configureWithOpaqueBackground()
    //        barTintColor.backgroundColor = UIColor.init(Color(red: 92 / 255, green: 181 / 255, blue: 184 / 255))
    //        barTintColor.titleTextAttributes = [.foregroundColor: UIColor(Color.white)]
    //        barTintColor.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.white)]
    //        UINavigationBar.appearance().scrollEdgeAppearance = barTintColor
    //        UINavigationBar.appearance().standardAppearance = barTintColor
    //
    //        // MARK: Tab Bar
    //        let tabBarTintColor = UITabBarAppearance()
    //        tabBarTintColor.configureWithOpaqueBackground()
    //        tabBarTintColor.backgroundColor = UIColor.init(Color(red: 241 / 255, green: 242 / 255, blue: 237 / 255))
    //        UITabBar.appearance().scrollEdgeAppearance = tabBarTintColor
    //        UITabBar.appearance().standardAppearance = tabBarTintColor
    //
    //        UITextView.appearance().backgroundColor = UIColor(Color(red: 241 / 255, green: 242 / 255, blue: 237 / 255))
    //        UITableView.appearance().backgroundColor = UIColor(Color(red: 241 / 255, green: 242 / 255, blue: 237 / 255))
    //        UITableViewCell.appearance().backgroundColor = UIColor(Color(red: 241 / 255, green: 242 / 255, blue: 237 / 255))
    //    }
    //
    //    let dummyActivity = [
    //        Activity(activDate: "07-Mar", activName: "James Jones", activAmount: 135.25),
    //        Activity(activDate: "07-Mar", activName: "Russell Wilson", activAmount: 450.00),
    //        Activity(activDate: "05-Mar", activName: "Multichoice Africa *AG18773", activAmount: 65.15),
    //        Activity(activDate: "04-Mar", activName: "Mobile top-up (eco) * - 9837", activAmount: 45.00),
    //        Activity(activDate: "02-Mar", activName: "Stanford Khumalo", activAmount: 120.00),
    //        Activity(activDate: "28-Feb", activName: "James Jones", activAmount: 750.29),
    //        Activity(activDate: "26-Feb", activName: "Adija Portmore", activAmount: 250.65)
    //    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                cynWhite
                VStack {
                    Rectangle()
                        .fill(Color(red: 92 / 255, green: 181 / 255, blue: 184 / 255))
                        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                        .frame(width: UIScreen.main.bounds.width, height: 110)
                        .edgesIgnoringSafeArea(.all)
                        .overlay(
                            VStack {
                                HStack {
                                    
                                    Spacer()
                                    
                                    // MARK: Send Funds View
                                    NavigationLink(
                                        destination: PaymentsView()){
                                            HStack {
                                                Image("send")
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .frame(width: 25, height: 25)
                                                    .foregroundColor(.white)
                                                Text("Transfer")
                                                    .font(.system(size: 14))
                                                    .foregroundColor(.white)
                                                    .fontWeight(.semibold)
                                            }
                                            .frame(width: 120, height: 50)
                                            .background(cynRed)
                                            .clipShape(Capsule())
                                        }
                                    
                                    // MARK: "Rounds" View
                                    NavigationLink(
                                        destination: SavingsPotsView()){
                                            HStack {
                                                Image("rounds")
                                                    .resizable()
                                                    .renderingMode(.template)
                                                    .frame(width: 30, height: 30)
                                                    .foregroundColor(.white)
                                                Text("Rounds")
                                                    .font(.system(size: 14))
                                                    .foregroundColor(.white)
                                                    .fontWeight(.semibold)
                                            }
                                            .frame(width: 120, height: 50)
                                            .background(cynBlue)
                                            .clipShape(Capsule())
                                        }
                                }
                                .padding(20)
                            })
                    
                    // MARK: Card Views
                    HStack {
                        ZStack {
                            CardFrontView(width: width, height: height, degree: $rotationAngleBack)
                            CardBackView(width: width, height: height, degree: $rotationAngleFront)
                        }
                        .frame(width: 260, height: 160)
                        
                        // MARK: Account Information
                        VStack {
                            Button(action: {
                                self.showAccountDetailsSheetView.toggle()
                            }, label: {
                                Image(systemName: "info.circle.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding(10)
                                    .background(cynGreen.opacity(0.1))
                                    .clipShape(Circle())
                            })
                            
                            // MARK: Flip Card
                            Button(action: {
                                self.cardAnimation()
                            }, label: {
                                VStack {
                                    if isCardFlipped == true {
                                        Image(systemName: "creditcard.fill")
                                            .resizable()
                                            .frame(width: 25, height: 20)
                                            .padding(10)
                                            .background(cynGreen.opacity(0.1))
                                            .clipShape(Circle())
                                    } else {
                                        Image(systemName: "creditcard.and.123")
                                            .resizable()
                                            .frame(width: 25, height: 20)
                                            .padding(10)
                                            .background(cynGreen.opacity(0.1))
                                            .clipShape(Circle())
                                    }
                                }
                            }).onTapGesture {
                                cardAnimation()
                            }
                            
                            // MARK: Freeze Account
                            Button(action: {
                                self.showAccFreezeAlert.toggle()
                            }, label: {
                                Image(systemName: "snowflake.circle")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding(10)
                                    .background(cynGreen.opacity(0.1))
                                    .clipShape(Circle())
                            }).alert(isPresented: $showAccFreezeAlert) {
                                Alert(
                                    title: Text("Freeze Your Account"),
                                    message: Text("Use this feature to temporarily block your account if your card is lost/stolen."),
                                    primaryButton: .destructive(Text("Freeze")) {
                                        
                                    },
                                    secondaryButton: .cancel()
                                )
                            }
                            
                            Spacer()
                        }
                        .frame(height: 150)
                        .padding(.trailing, 5)
                    }
                    
                    Spacer()
                }
            }
            .sheet(isPresented: $showAccountDetailsSheetView) {
                AccountDetailsView()
            }
            .sheet(isPresented: $showDepositSheetView) {
                AccountDepositView()
            }
            .accentColor(cynGreen)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    VStack {
                        Text("Coynitt")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(cynWhite)
                            .textCase(.uppercase)
                        
                        Text("@\(String(userTag))")
                            .font(.system(size: 10))
                            .foregroundColor(cynWhite)
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    // MARK: Help Button
                    Button(action: {
                        
                    }, label: {
                        VStack {
                            Image(systemName: "lifepreserver")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(cynWhite)
                                .clipShape(Circle())
                            
                            Text("Help")
                                .font(.system(size: 10))
                                .foregroundColor(cynWhite)
                        }
                    })
                }
            }
        }.accentColor(cynWhite)
    }
}
