//
//  MainView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 08/03/2022.
//

import SwiftUI

struct MainView: View {
    
    @State var accBalance : Double = 129498.18
    @State private var accNum : Int = 373812093
    @State var fName : String = "Samuel"
    @State private var userTag : String = "samthing90"
    @State var txAmount : Double  = 0.00
    
    @State var rowHeight = 50.0 // sets row height for list
    @State private var showAccountDetailsSheetView = false
    @State private var showDepositSheetView = false
    @State var showAccFreezeAlert = false
    @State var showTransferActiveSheet = false
    @State var isTransferActiveSheetPresented = false
    @State var showDepositActiveSheet = false
    @State var depositActivitySheet: DepositActivitySheet?
    @State private var showQrSheet = false
    
    init() {
        // MARK: Nav Bar
        let barTintColor = UINavigationBarAppearance()
        barTintColor.configureWithOpaqueBackground()
        barTintColor.shadowColor = .clear // hides nav bar bottom separator
        barTintColor.backgroundColor = UIColor.init(Color(red: 92 / 255, green: 181 / 255, blue: 184 / 255))
        barTintColor.titleTextAttributes = [.foregroundColor: UIColor(Color.white)]
        barTintColor.largeTitleTextAttributes = [.foregroundColor: UIColor(Color.white)]
        UINavigationBar.appearance().scrollEdgeAppearance = barTintColor
        UINavigationBar.appearance().standardAppearance = barTintColor
        
        
        // MARK: Tab Bar
        let tabBarTintColor = UITabBarAppearance()
        tabBarTintColor.configureWithOpaqueBackground()
        tabBarTintColor.shadowColor = .clear
        tabBarTintColor.backgroundColor = UIColor.init(Color(red: 242 / 255, green: 241 / 255, blue: 237 / 255))
        tabBarTintColor.selectionIndicatorTintColor = UIColor.init(Color(red: 242 / 255, green: 241 / 255, blue: 237 / 255))
        UITabBar.appearance().scrollEdgeAppearance = tabBarTintColor
        UITabBar.appearance().standardAppearance = tabBarTintColor
        
        UITextView.appearance().backgroundColor = UIColor(Color(red: 241 / 255, green: 242 / 255, blue: 237 / 255))
        UITableView.appearance().backgroundColor = UIColor(Color(red: 241 / 255, green: 242 / 255, blue: 237 / 255))
        UITableViewCell.appearance().backgroundColor = UIColor(Color(red: 241 / 255, green: 242 / 255, blue: 237 / 255))
    }
    
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
                                    // MARK: User Profile View
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
                                    
                                    VStack {
                                        
                                        Text("Available Balance: ")
                                            .font(.custom("Avenir", size: 12))
                                            .fontWeight(.bold)
                                            .foregroundColor(Color(uiColor: .darkGray))
                                        
                                        HStack {
                                            Image("united-states")
                                                .resizable()
                                                .frame(width: 18, height: 18)
                                                .padding(5)
                                            
                                            Text("$\(accBalance, specifier: "%.2f")")
                                                .font(.custom("Avenir", size: 18
                                                             ))
                                                .fontWeight(.bold)
                                                .foregroundColor(Color(uiColor: .darkGray))
                                        }
                                        
                                    }
                                    .frame(width: 200, height: 100)
                                    .padding(.horizontal, 10)
                                    
                                    
                                }
                                .padding(10)
                                
                            }
                                .padding(.top, 20))
                    
                    // MARK: Keypad
                    NavigationView {
                        
                        KeypadEntry()
                        
                    }
                    
                    HStack {
                        // MARK: "Deposit"
                        Button(action: {
                            self.showDepositActiveSheet.toggle()
                        }, label: {
                            HStack {
                                Image(systemName: "plus.square") // Notifications button
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(cynWhite)
                                Text("Deposit")
                                    .font(.custom("Avenir", size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(cynWhite)
                            }
                        })
                        .frame(width: 150, height: 60)
                        .background(cynGreen)
                        .cornerRadius(10)
                        .padding(5)
                        .actionSheet(isPresented: $showDepositActiveSheet) {
                            ActionSheet(title: Text("Deposit Funds"), message: Text("Add funds to wallet"), buttons: [
                                .default(Text("Apple Pay")){
                                    depositActivitySheet = .appl_pay
                                },
                                .default(Text("Debit / Credit card")){
                                    depositActivitySheet = .appl_pay
                                },
                                .cancel()
                            ])
                        }
                        
                        // MARK: "Quick Send" Button
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Image(systemName: "paperplane.fill") // Notifications button
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(cynGreen)
                                Text("Quick Send")
                                    .font(.custom("Avenir", size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(cynGreen)
                            }
                        })
                        .frame(width: 150, height: 60)
                        .background(cynGreen.opacity(0.1))
                        .cornerRadius(10)
                        .padding(5)
                    }
                }
                
                Spacer()
            }
            .background(Color.white)
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
                    // MARK: QR Code Button
                    Button(action: {
                        showQrSheet.toggle()
                    }, label: {
                        Image(systemName: "qrcode") // Notifications button
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(cynWhite)
                    }).sheet(isPresented: $showQrSheet) {
                        Text("QR code appears here.....")
                        
                    }
                    
                    // MARK: Notifications Button
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "bell.fill")
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

struct KeyPad : View {
    @Binding var txDigits : [String]
    
    var body : some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(datas){ i in
                HStack(spacing: self.getSpacing()){
                    ForEach(i.row){ j in
                        
                        Button(action: {
                            if j.value == "delete.left.fill" {
                                self.txDigits.removeLast()
                            } else {
                                self.txDigits.append(j.value)
                                
                                // MARK: Digit Entry Limit
                                if self.txDigits.count == 8 {
                                    NotificationCenter.default.post(name: NSNotification.Name("Successful"), object: nil)
                                    
                                    self.txDigits.removeAll()
                                }
                            }
                        }) {
                            if j.value == "delete.left.fill" {
                                Image(systemName: j.value).font(.body).padding(.vertical)
                            } else {
                                Text(j.value).font(.title).fontWeight(.bold).padding(.vertical)
                            }
                        }
                        .frame(width: 60, height: 60)
                        .foregroundColor(cynGreen)
                        .padding(5)
                        .background(cynGreen.opacity(0.1))
                        .clipShape(Circle())
                    }
                }
            }
        }
        .accentColor(cynGreen)
    }
    
    func getSpacing()-> CGFloat {
        return UIScreen.main.bounds.width / 8
    }
}

// MARK: Keypad Entry
struct KeypadEntry : View {
    
    @State var amtDigits : [String] = []
    
    var body : some View {
        
        ZStack {
            cynWhite
            VStack {
                HStack(spacing: 10) {
                    Text("$")
                        .font(.custom("Avenir", size: 60))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(uiColor: .darkGray))
                    
                    ForEach(amtDigits, id: \.self){ i in
                        Text(i)
                            .font(.custom("Avenir", size: 60))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(uiColor: .darkGray))
                    }
                }
                
                Spacer()
                    .frame(height: 10)
                
                KeyPad(txDigits: $amtDigits)
            }
        }
    }
}

// MARK: Deposit Activity Sheet enum
enum DepositActivitySheet: Identifiable {
    case appl_pay, chq_deposit
    
    var id: Int {
        hashValue
    }
}

// MARK: Keypad Datas
struct type: Identifiable {
    var id : Int
    var row: [row]
}

struct row : Identifiable {
    var id: Int
    var value : String
}

var datas = [
    
    type(id: 0, row: [row(id: 0, value: "1"), row(id: 1, value: "2"), row(id: 2, value: "3")]),
    type(id: 1, row: [row(id: 0, value: "4"), row(id: 1, value: "5"), row(id: 2, value: "6")]),
    type(id: 2, row: [row(id: 0, value: "7"), row(id: 1, value: "8"), row(id: 2, value: "9")]),
    type(id: 3, row: [row(id: 0, value: "."), row(id: 1, value: "0"), row(id: 2, value: "delete.left.fill")]),
]

