//
//  MainView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 08/03/2022.
//

import SwiftUI

struct MainView: View {
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
    
    init() {
        // MARK: Nav Bar
        let barTintColor = UINavigationBarAppearance()
        barTintColor.configureWithOpaqueBackground()
        barTintColor.backgroundColor = UIColor.init(Color(red: 92 / 255, green: 181 / 255, blue: 184 / 255))
        barTintColor.titleTextAttributes = [.foregroundColor: UIColor(Color.white)]
        barTintColor.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.white)]
        UINavigationBar.appearance().scrollEdgeAppearance = barTintColor
        UINavigationBar.appearance().standardAppearance = barTintColor
        
        // MARK: Tab Bar
        let tabBarTintColor = UITabBarAppearance()
        tabBarTintColor.configureWithOpaqueBackground()
        tabBarTintColor.backgroundColor = UIColor.init(Color(red: 241 / 255, green: 242 / 255, blue: 237 / 255))
        UITabBar.appearance().scrollEdgeAppearance = tabBarTintColor
        UITabBar.appearance().standardAppearance = tabBarTintColor
        
        UITextView.appearance().backgroundColor = UIColor(Color(red: 241 / 255, green: 242 / 255, blue: 237 / 255))
        UITableView.appearance().backgroundColor = UIColor(Color(red: 241 / 255, green: 242 / 255, blue: 237 / 255))
        UITableViewCell.appearance().backgroundColor = UIColor(Color(red: 241 / 255, green: 242 / 255, blue: 237 / 255))
    }
    
    let dummyActivity = [
        Activity(activDate: "07-Mar", activName: "James Jones", activAmount: 135.25),
        Activity(activDate: "07-Mar", activName: "Russell Wilson", activAmount: 450.00),
        Activity(activDate: "05-Mar", activName: "Multichoice Africa *AG18773", activAmount: 65.15),
        Activity(activDate: "04-Mar", activName: "Mobile top-up (eco) * - 9837", activAmount: 45.00),
        Activity(activDate: "02-Mar", activName: "Stanford Khumalo", activAmount: 120.00),
        Activity(activDate: "28-Feb", activName: "James Jones", activAmount: 750.29),
        Activity(activDate: "26-Feb", activName: "Adija Portmore", activAmount: 250.65)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                bgWhite()
                VStack {
                    VStack {
                        HStack {
                            // MARK: USer Profile View
                            NavigationLink(
                                destination: UserProfileView()){
                                    VStack {
                                        Image("dummy-image")
                                            .resizable()
                                            .scaledToFill()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                            .frame(width: 35, height: 35)
                                            .foregroundColor(cynGreen)
                                            .clipShape(Circle())
                                            .padding(5)
                                        
                                        Text("Hi, \(fName)")
                                            .font(.system(size: 12))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                            .fontWeight(.semibold)
                                            .scaledToFill()
                                            .minimumScaleFactor(0.5)
                                    }
                                }
                            
                            Spacer()
                            
                            // MARK: Deposit Money View
                            Button(action: {
                                //                            self.showDepositSheetView.toggle()
                                self.showDepositActiveSheet.toggle()
                            }, label: {
                                VStack {
                                    Image(systemName: "plus.circle")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(cynGreen)
                                        .padding(10)
                                        .background(cynGreen.opacity(0.1))
                                        .clipShape(Circle())
                                    Text("Add Funds")
                                        .font(.system(size: 11))
                                        .foregroundColor(.black)
                                        .fontWeight(.semibold)
                                }
                            })
                            .actionSheet(isPresented: $showDepositActiveSheet) {
                                ActionSheet(title: Text("Deposit Funds"), message: Text("How would you like to deposit the funds?"), buttons: [
                                    .default(Text("Apple Pay")){
                                        depositActivitySheet = .appl_pay
                                    },
                                    .default(Text("Debit / Credit card")){
                                        depositActivitySheet = .appl_pay
                                    },
                                    .default(Text("scan Coynitt tag")){
                                        depositActivitySheet = .chq_deposit
                                    },
                                    .cancel()
                                ])
                            }
                            
//                            Button(action: {
//                                self.showTransferActiveSheet.toggle()
//                            }, label: {
//                                VStack {
//                                    Image(systemName: "paperplane.circle")
//                                        .resizable()
//                                        .frame(width: 25, height: 25)
//                                        .foregroundColor(.white)
//                                        .padding(10)
//                                        .background(cynRed)
//                                        .clipShape(Circle())
//                                    Text("Send")
//                                        .font(.system(size: 11))
//                                        .foregroundColor(.black)
//                                        .fontWeight(.semibold)
//                                }
//                            })
//                            .actionSheet(isPresented: $showTransferActiveSheet) {
//                                ActionSheet(title: Text("Transfer Money"), message: Text("How would you like to send the money?"), buttons: [
//                                    .default(Text("Local Bank Transfer")){
//                                        self.actionViewMode = .bank_tx
//                                        self.isTransferActiveSheetPresented = true
//                                    },
//                                    .default(Text("International Transfer")){
//                                        self.actionViewMode = .international_tx
//                                        self.isTransferActiveSheetPresented = true
//                                    },
//                                    .cancel()
//                                ])
//                            }
//                            .sheet(isPresented: $isTransferActiveSheetPresented) {
//                                self.actionViewMode.view
//                            }
                            
                            // MARK: Send Funds View
                            NavigationLink(
                                destination: PaymentsView()){
                                    VStack {
                                        Image(systemName: "paperplane.circle")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .background(cynRed)
                                            .clipShape(Circle())
                                        Text("Send")
                                            .font(.system(size: 11))
                                            .foregroundColor(.black)
                                            .fontWeight(.semibold)
                                    }
                                }
                            
                            // MARK: Savings Pot View
                            NavigationLink(
                                destination: SavingsPotsView()){
                                    VStack {
                                        Image(systemName: "tray.circle")
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .background(cynBlue)
                                            .clipShape(Circle())
                                        Text("Payments")
                                            .font(.system(size: 11))
                                            .foregroundColor(.black)
                                            .fontWeight(.semibold)
                                    }
                                }
                        }
                        .padding(.vertical)
                        .padding(.horizontal)
                    }
                    
                    
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
                                    
                                    //                                    if isCardFlipped == true {
                                    //                                        Text("Card Front")
                                    //                                            .font(.system(size: 11))
                                    //                                            .foregroundColor(.black)
                                    //                                    } else {
                                    //                                        Text("Card Back")
                                    //                                            .font(.system(size: 11))
                                    //                                            .foregroundColor(.black)
                                    //                                    }
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
                        .frame(height: 20)
                    
                    HStack {
                        Text("Recent Transactions")
                            .font(.system(size: 12))
                            .bold()
                            .foregroundColor(.gray)
                            .textCase(.uppercase)
                        
                        Spacer()
                        
                        HStack{
                            Text("See All")
                                .bold()
                            Image(systemName: "chevron.right")
                        }
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                        .padding(10)
                    }.padding(.leading, 30)
                    
                    // MARK: Latest Activity
                    Form {
                        Section {
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
                    // MARK: Notifications
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "bell.fill") // Notifications button
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(cynWhite)
                            .clipShape(Circle())
                    })
                    
                    // MARK: Help
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "lifepreserver") // Notifications button
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(cynWhite)
                            .clipShape(Circle())
                    })
                }
            }
        }.accentColor(cynWhite)
    }
}

// MARK: Deposit Activity Sheet enum
enum DepositActivitySheet: Identifiable {
    case appl_pay, chq_deposit
    
    var id: Int {
        hashValue
    }
}

